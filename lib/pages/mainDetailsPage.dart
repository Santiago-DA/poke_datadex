import 'package:flutter/material.dart';
import 'package:poke_datadex/widgets/mainDetails/SpeciesCard.dart';
import 'package:poke_datadex/widgets/mainDetails/abilitesCard.dart';
import 'package:provider/provider.dart';

class MainDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SpeciesCard(),
          const SizedBox(height: 8),
          AbilitiesCard(),
        ],
      ),
    );
  }
}
