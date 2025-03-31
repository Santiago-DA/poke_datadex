import 'package:flutter/material.dart';
import 'package:poke_datadex/Themes/TypesColors.dart';
import 'package:provider/provider.dart';

import '../Themes/themeProvider.dart';

class TypeChip extends StatelessWidget {
  TypeChip({super.key, required this.type});
  String type;
  @override
  Widget build(BuildContext context) {
    Color color = PokemonTypeColors.getColor(type);
    final theme = Provider.of<ThemeProvider>(context).themeMode;
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: 80,
        height: 24,
        child: Center(
          child: Text(type),
        ),
      ),
    );
  }
}
