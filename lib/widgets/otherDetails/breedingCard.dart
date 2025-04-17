import 'package:flutter/material.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:poke_datadex/widgets/otherDetails/eggGroupChip.dart';
import 'package:provider/provider.dart';

import '../../features/currentPokemonProvider.dart';
import '../../features/pokeAPI.dart';

class BreedingCard extends StatefulWidget {
  @override
  _BreedingCard createState() => _BreedingCard();
}

class _BreedingCard extends State<BreedingCard> {
  bool isLoading = false;
  late Map<String, dynamic> speciesData;
  List<String> eggNames = ["no data"];

  @override
  void initState() {
    super.initState();
    _fetchSpeciesData();
  }

  Future<void> _fetchSpeciesData() async {
    setState(() => isLoading = true);
    try {
      Pokemon pokemon =
          Provider.of<CurrentPokemonProvider>(context, listen: false)
              .currentPokemon;
      speciesData = await PokeApiManager().getPokemonSpecies(pokemon.id);
      setState(() {
        isLoading = false;
        eggNames = _getEggGroupNames(); // Update eggNames when data loads
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        speciesData = {};
      });
    }
  }

  List<String> _getEggGroupNames() {
    if (speciesData.isEmpty || !speciesData.containsKey("egg_groups")) {
      return ["No egg groups"];
    }
    final eggGroups = speciesData["egg_groups"] as List<dynamic>;
    return eggGroups.isEmpty
        ? ["No egg groups"]
        : eggGroups.map<String>((group) => group["name"] as String).toList();
  }

  @override
  Widget build(BuildContext context) {
    Pokemon pokemon =
        Provider.of<CurrentPokemonProvider>(context).currentPokemon;

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
                    pokemon.capitalizedName,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Egg Groups",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: eggNames
                        .map((name) => EggGroupChip(
                              name: name,
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 12),
                  // Add egg cycles widget here later
                  Text(
                    "Egg Cycles: ${speciesData["hatch_counter"]}",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
      ),
    );
  }
}
