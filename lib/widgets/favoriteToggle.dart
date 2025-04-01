import 'package:flutter/material.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:provider/provider.dart';
import 'package:poke_datadex/features/favoritePokemons.dart';

class FavoriteToggle extends StatefulWidget {
  final Pokemon pokemon;
  bool isFavorited;

  FavoriteToggle({
    required this.pokemon,
    this.isFavorited = false,
  });
  @override
  _FavoriteToggle createState() => _FavoriteToggle();
}

class _FavoriteToggle extends State<FavoriteToggle> {
  late bool isFilled;

  @override
  void initState() {
    super.initState();
    isFilled = widget.isFavorited; // Uses the provided value or default false
  }

  @override
  Widget build(BuildContext context) {
    int pkmId = widget.pokemon.id;
    String name = widget.pokemon.name;
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return IconButton(
      onPressed: () {
        setState(() {
          isFilled = !isFilled;
        });
        favoritesProvider.toggleFavorite(pkmId);
      },
      icon: Icon(
        isFilled ? Icons.favorite : Icons.favorite_border,
        color: isFilled ? Colors.red : null,
      ),
    );
  }
}
