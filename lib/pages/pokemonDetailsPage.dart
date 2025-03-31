import 'package:flutter/material.dart';
import 'package:poke_datadex/models/pokemon.dart';

class PokemonDetailsPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    var z = pokemon.name;
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(
        child: Text(z),
      ),
    );
  }
}
