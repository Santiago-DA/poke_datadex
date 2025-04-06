import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:poke_datadex/features/currentPokemonProvider.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:provider/provider.dart';
import 'package:poke_datadex/widgets/typeChip.dart';
import 'package:poke_datadex/features/pokeAPI.dart';
import 'package:poke_datadex/features/GenderRatio.dart';

class SpeciesCard extends StatefulWidget {
  @override
  _SpeciesCard createState() => _SpeciesCard();
}

class _SpeciesCard extends State<SpeciesCard> {
  late Pokemon pokemon;
  late Map<String, dynamic> speciesData;
  String pkmDescription = "Loading..."; // Instead of ""
  bool isLoading = false;
  PokemonGender gender = PokemonGender(genderRate: -1);

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
        gender = PokemonGender(genderRate: speciesData["gender_rate"]);
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        pkmDescription = "notFound"; // Explicit fallback on error
        gender = PokemonGender(genderRate: -1);
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
    var weight = pokemon.json["weight"];
    var height = pokemon.json["height"];
    weight = weight / 10;
    height = height / 10;

    return Card(
      elevation: 4,
      //color: Color.lerp(Theme.of(context).primaryColor, Colors.white, .80),
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
          children: [
            //tittle
            Text(
              pokemon.capitalizedName,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 4),
            //desciption
            isLoading
                ? CircularProgressIndicator()
                : Text(
                    pkmDescription,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
            //types
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.types
                  .map(
                    (type) => TypeChip(type: type.name),
                  )
                  .toList(),
            ),
            const SizedBox(height: 4),
            //weight height
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                //weight
                Text(
                  "Weight: ${weight}kg",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(width: 16),
                //height
                Text(
                  "Height: ${height}m",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 4),
            //cry Button / gender ratio
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () async {
                    final player = AudioPlayer();
                    await player
                        .play(UrlSource(pokemon.json["cries"]["latest"]));
                  },
                  label: Text("play Cry"),
                  icon: Icon(Icons.volume_up_outlined),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Use theme's primary color
                      width: 1.0,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                //gender
                gender.isGenderless
                    ? Text(
                        "Genderless",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.female,
                                color: Colors.pink,
                              ),
                              Text(
                                "${gender.femaleRatio * 100}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.male,
                                color: Colors.blue,
                              ),
                              Text(
                                "${gender.maleRatio * 100}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
