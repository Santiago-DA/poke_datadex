import 'package:flutter/material.dart';
import 'package:poke_datadex/features/currentPokemonProvider.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:provider/provider.dart';
import 'package:poke_datadex/widgets/typeChip.dart';
import 'package:poke_datadex/features/pokeAPI.dart';

class SpeciesCard extends StatefulWidget {
  @override
  _SpeciesCard createState() => _SpeciesCard();
}

class _SpeciesCard extends State<SpeciesCard> {
  late Pokemon pokemon;
  late Map<String, dynamic> speciesData;
  String pkmDescription = "Loading..."; // Instead of ""
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchSpeciesData();
  }

  Future<void> _fetchSpeciesData() async {
    setState(() => isLoading = true);
    try {
      pokemon = Provider.of<CurrentPokemonProvider>(context, listen: false)
          .currentPokemon;
      speciesData = await PokeApiManager().getPokemonSpecies(pokemon.id);
      setState(() {
        isLoading = false;
        pkmDescription = getPokemonDescription(); // Moved inside setState
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        pkmDescription = "notFound"; // Explicit fallback on error
      });
    }
  }

  String getPokemonDescription() {
    final entries = (speciesData["flavor_text_entries"] as List?) ?? [];
    for (final entry in entries) {
      if (entry is Map && entry["language"]?["name"] == "en") {
        return (entry["flavor_text"] as String?)?.replaceAll('\n', ' ') ??
            "notFound";
      }
    }
    return "notFound";
  }

  @override
  Widget build(BuildContext context) {
    pokemon = Provider.of<CurrentPokemonProvider>(context).currentPokemon;
    return Card(
      elevation: 4,
      color: Color.lerp(Theme.of(context).primaryColor, Colors.white, .80),
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //tittle
            Text(
              pokemon.capitalizedName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            //desciption
            isLoading ? CircularProgressIndicator() : Text(pkmDescription),
            //types
            //weight height
            //cry Button / gender ratio
          ],
        ),
      ),
    );
  }
}
