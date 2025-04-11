import 'package:flutter/material.dart';
import 'package:poke_datadex/features/currentPokemonProvider.dart';
import 'package:poke_datadex/features/pokeAPI.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:provider/provider.dart';

class AbilitiesCard extends StatefulWidget {
  @override
  _AbilitiesCardState createState() => _AbilitiesCardState();
}

class _AbilitiesCardState extends State<AbilitiesCard> {
  Pokemon pokemon = Pokemon.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchAbilities();
  }

  Future<void> fetchAbilities() async {
    if (isLoading) return;
    setState(() => isLoading = true);

    final provider =
        Provider.of<CurrentPokemonProvider>(context, listen: false);
    final currentPokemon = provider.currentPokemon;

    try {
      List<Map<String, dynamic>> abilitiesData = [];
      for (var ability in currentPokemon.abilities) {
        var data = await PokeApiManager().getAbilityDetails(ability.name);
        abilitiesData.add(data);
      }
      _parseAbilities(abilitiesData, currentPokemon);
      provider.notifyListeners(); // Assuming provider is a ChangeNotifier
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _parseAbilities(List<Map<String, dynamic>> rawData, Pokemon pokemon) {
    for (int i = 0; i < rawData.length; i++) {
      var ability = rawData[i];
      //name
      final String name = ability["name"];
      //description
      final effectEntries = ability['effect_entries'] as List;
      final englishEffect = effectEntries.firstWhere(
        (entry) => entry['language']['name'] == 'en',
        orElse: () => {'effect': 'No description available'},
      )['effect'];
      //flavor text
      final flavorTextEntries = ability['flavor_text_entries'] as List;
      final englishFlavorText = flavorTextEntries.firstWhere(
        (entry) => entry['language']['name'] == 'en',
        orElse: () => {'flavor_text': 'No flavor text available'},
      )['flavor_text'];
      pokemon.abilities[i].name = name;
      pokemon.abilities[i].description = englishEffect;
      pokemon.abilities[i].flavorText = englishFlavorText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<CurrentPokemonProvider>(context).currentPokemon;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Text(
                    "Abilities",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemon.abilities
                        .map(
                          (ability) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            margin: EdgeInsets.all(4),
                            color: Color.lerp(
                              Theme.of(context).canvasColor,
                              Theme.of(context).primaryColor,
                              0.30,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            ability.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Description",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                              Text(
                                                ability.flavorText,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              Text(
                                                "Effect",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                              Text(
                                                ability.description,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: ability.isHidden
                                      ? Text(
                                          "${ability.name} - Hidden",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        )
                                      : Text(
                                          ability.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
      ),
    );
  }
}
