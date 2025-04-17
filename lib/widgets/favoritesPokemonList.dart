import 'package:flutter/material.dart';
import 'package:poke_datadex/features/favoritePokemons.dart';
import 'package:poke_datadex/features/pokeAPI.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:poke_datadex/widgets/pokemonListItem.dart';
import 'package:provider/provider.dart';

class FavoritesPokemonList extends StatefulWidget {
  @override
  _FavoritesPokemonList createState() => _FavoritesPokemonList();
}

class _FavoritesPokemonList extends State<FavoritesPokemonList> {
  bool isLoading = false;
  List<Pokemon> _pokemons = [];
  String? _errorMessage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchPokemons();
  }

  Future<void> _fetchPokemons() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
      _errorMessage = null;
    });

    try {
      final favoritesProvider =
          Provider.of<FavoritesProvider>(context, listen: false);
      final indexes = favoritesProvider.favorites.toList();

      final pokemons = await Future.wait(
        indexes.map((index) async {
          final json = await PokeApiManager().getPokemonDetails(index);
          return Pokemon.fromJson(json);
        }),
      );

      setState(() {
        _pokemons = pokemons;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load favorites';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : _pokemons.isEmpty
            ? Center(child: Text("No Favorites"))
            : ListView.builder(
                itemCount: _pokemons.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 4),
                    child: PokemonListItem(
                      pokemon: _pokemons[index],
                    ),
                  );
                },
              );
  }
}
