import 'package:flutter/material.dart';
import 'package:poke_datadex/features/pokeAPI.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:poke_datadex/widgets/favoritesPokemonList.dart';
import 'package:provider/provider.dart';
import 'package:poke_datadex/features/favoritePokemons.dart';
import '../widgets/pokemonListItem.dart';

class FavoritesPkmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: FavoritesPokemonList(),
    );
  }
}
