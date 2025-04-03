import 'package:flutter/material.dart';
import 'package:poke_datadex/widgets/mainDetails/SpeciesCard.dart';

class MainDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SpeciesCard(),
        ],
      ),
    );
  }
}
