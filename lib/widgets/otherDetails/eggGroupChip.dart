import 'package:flutter/material.dart';

class EggGroupChip extends StatelessWidget {
  String name;

  EggGroupChip({required this.name});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).scaffoldBackgroundColor;
    if ((name == "ditto") || (name == "no-eggs")) {
      color = Colors.grey;
    }
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: 120,
        height: 24,
        child: Center(
          child: Text(name),
        ),
      ),
    );
  }
}
