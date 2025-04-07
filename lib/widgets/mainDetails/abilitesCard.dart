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
      print(name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<CurrentPokemonProvider>(context).currentPokemon;
    return Card(
      child: isLoading
          ? CircularProgressIndicator()
          : Column(
              children: pokemon.abilities
                  .map(
                    (ability) => Text(ability.name),
                  )
                  .toList(),
            ),
    );
  }
}
