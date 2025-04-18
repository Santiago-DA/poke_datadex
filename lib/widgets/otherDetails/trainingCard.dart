import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/currentPokemonProvider.dart';
import '../../features/pokeAPI.dart';
import '../../models/pokemon.dart';

class TrainingCard extends StatefulWidget {
  @override
  _TrainingCard createState() => _TrainingCard();
}

class _TrainingCard extends State<TrainingCard> {
  bool isLoading = false;
  late Map<String, dynamic> speciesData;
  late Map<String, int> evYield;

  @override
  void initState() {
    super.initState();
    _fetchSpeciesData();
    _calculateEVYield();
  }

  String _formatEVYield() {
    if (evYield.isEmpty) return "None";

    return evYield.entries.map((entry) {
      // Format stat names to be capitalized and without dashes
      String statName = entry.key
          .replaceAll('-',
              ' ') // Replace hyphens with spaces (e.g., "special-attack" → "special attack")
          .split(' ') // Split into words
          .map((word) =>
              word[0].toUpperCase() + word.substring(1)) // Capitalize each word
          .join(' '); // Rejoin with spaces

      return "${entry.value} $statName";
    }).join(', ');
  }

  void _calculateEVYield() {
    Pokemon pokemon =
        Provider.of<CurrentPokemonProvider>(context, listen: false)
            .currentPokemon;
    evYield = {};

    // Assuming pokemon.json["stats"] is a List of stat objects
    for (var stat in pokemon.json["stats"]) {
      if (stat["effort"] > 0) {
        String statName = stat["stat"]["name"]; // e.g., "hp", "attack", etc.
        evYield[statName] = stat["effort"];
      }
    }
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
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        speciesData = {};
      });
    }
  }

  String _formtatCartureRate(number) {
    if (speciesData.isEmpty) return "None";
    // Calculate the percentage: (100 * number) / (3 * 255)
    double percentage = (100 * number) / (3 * 255);

    // Round to 2 decimal places
    String percentageString = percentage.toStringAsFixed(2);

    return "$number ($percentageString%)";
  }

  @override
  Widget build(BuildContext context) {
    Pokemon pokemon =
        Provider.of<CurrentPokemonProvider>(context).currentPokemon;
    return isLoading
        ? CircularProgressIndicator()
        : Card(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //tittle
                  Text(
                    "Training",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8),
                  //GR - base EXP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          "Growth Rate: ${speciesData["growth_rate"]["name"]}"),
                      Text("Base EXP: ${pokemon.json["base_experience"]}"),
                    ],
                  ),
                  const SizedBox(height: 6),
                  //EV Yield - happiness
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("EV Yield: ${_formatEVYield()}"),
                      Text("Happiness: ${speciesData["base_happiness"]}"),
                    ],
                  ),
                  const SizedBox(height: 6),
                  //CR
                  Text(
                      "Carture Rate: ${_formtatCartureRate(speciesData["capture_rate"])}"),
                ],
              ),
            ),
          );
  }
}
