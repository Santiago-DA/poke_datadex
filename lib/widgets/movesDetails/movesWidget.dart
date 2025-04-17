import 'package:flutter/material.dart';
import 'package:poke_datadex/features/currentPokemonProvider.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:provider/provider.dart';
import 'package:poke_datadex/models/move.dart';

import '../../features/pokeAPI.dart';

class MovesWidget extends StatefulWidget {
  @override
  _MovesWidget createState() => _MovesWidget();
}

class _MovesWidget extends State<MovesWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [],
      ),
    );
  }
}
