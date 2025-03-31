import 'package:flutter/material.dart';
import 'package:poke_datadex/models/pokemon.dart';

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
    return IconButton(
      onPressed: () {
        print(widget.pokemon.name);
        setState(() {
          isFilled = !isFilled;
        });
      },
      icon: Icon(
        isFilled ? Icons.favorite : Icons.favorite_border,
        color: isFilled ? Colors.red : null,
      ),
    );
  }
}
