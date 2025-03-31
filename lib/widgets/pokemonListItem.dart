import 'package:flutter/material.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:poke_datadex/pages/pokemonDetailsPage.dart';
import 'package:poke_datadex/widgets/favoriteToggle.dart';
import 'package:poke_datadex/widgets/typeChip.dart';

class PokemonListItem extends StatelessWidget {
  Pokemon pokemon;

  PokemonListItem({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final String pkmName = pokemon.name;
    final int pkmId = pokemon.id;

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailsPage(pokemon: pokemon),
          ),
        );
      },
      leading: Image.network(pokemon.imageUrl),
      title: Text("#$pkmId  $pkmName"),
      trailing: FavoriteToggle(
        pokemon: pokemon,
      ),
      subtitle: Row(
        children: pokemon.types
            .map(
              (type) => TypeChip(type: type.name),
            )
            .toList(),
      ),
    );
  }
}
