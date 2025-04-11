import 'package:flutter/material.dart';
import 'package:poke_datadex/features/currentPokemonProvider.dart';
import 'package:poke_datadex/widgets/typeChip.dart';
import 'package:provider/provider.dart';
import 'package:poke_datadex/features/typeDefencesManager.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:poke_datadex/models/pokemonTypes.dart';

class TypeDefences extends StatefulWidget {
  @override
  _TypeDefences createState() => _TypeDefences();
}

class _TypeDefences extends State<TypeDefences> {
  @override
  Widget build(BuildContext context) {
    Pokemon pokemon =
        Provider.of<CurrentPokemonProvider>(context).currentPokemon;
    final typeDefences =
        getDefenseEffectiveness(pokemon.types[0], pokemon.types[1]);

    //
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Type Defences",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDefenceRow("Super weak", typeDefences.superWeak),
                _buildDefenceRow("Weak", typeDefences.weak),
                _buildDefenceRow("Normal", typeDefences.normal),
                _buildDefenceRow("Resistant", typeDefences.resistant),
                _buildDefenceRow(
                    "Super resistant", typeDefences.superResistant),
                _buildDefenceRow("Immune", typeDefences.immune),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefenceRow(String title, Set<PokemonType> types) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fixed width title container with right border
          Container(
            width: 100,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          // Flexible container for the chips that can wrap
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 4.0, // spacing between chips
                runSpacing: 4.0, // spacing between chip lines
                children:
                    types.map((type) => TypeChip(type: type.name)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
