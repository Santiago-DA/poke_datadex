import 'package:flutter/material.dart';

class SpeciesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
