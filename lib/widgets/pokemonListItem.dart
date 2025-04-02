import 'package:flutter/material.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:poke_datadex/pages/pokemonDetailsPage.dart';
import 'package:poke_datadex/widgets/favoriteToggle.dart';
import 'package:poke_datadex/widgets/typeChip.dart';
import 'package:poke_datadex/features/favoritePokemons.dart';
import 'package:provider/provider.dart';

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
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    bool isFavorite = favoritesProvider.isFavorite(pkmId);

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailsPage(pokemon: pokemon),
          ),
        );
        print(favoritesProvider.favorites);
      },
      leading: Image.network(pokemon.imageUrl),
      title: Text("#$pkmId  $pkmName"),
      trailing: FavoriteToggle(
        pokemon: pokemon,
        isFavorited: isFavorite ? true : false,
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
