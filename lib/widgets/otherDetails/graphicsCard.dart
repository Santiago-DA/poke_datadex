import 'package:flutter/material.dart';

import '../../features/currentPokemonProvider.dart';
import '../../models/pokemon.dart';
import 'package:provider/provider.dart';

class GraphicsCard extends StatefulWidget {
  @override
  _GraphicsCard createState() => _GraphicsCard();
}

class _GraphicsCard extends State<GraphicsCard> {
  bool _shiny = false;

  @override
  Widget build(BuildContext context) {
    Pokemon pokemon =
        Provider.of<CurrentPokemonProvider>(context).currentPokemon;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Sprite",
              style: Theme.of(context).textTheme.displaySmall,
            ),

            //image
            _shiny
                ? Image.network(pokemon.json["sprites"]["other"]
                    ["official-artwork"]["front_shiny"])
                : Image.network(pokemon.json["sprites"]["other"]
                    ["official-artwork"]["front_default"]),
            //swich
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Shiny"),
                Switch(
                    value: _shiny,
                    onChanged: (bool value) {
                      setState(() {
                        _shiny = value;
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
