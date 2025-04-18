import 'package:flutter/material.dart';
import 'package:poke_datadex/widgets/otherDetails/breedingCard.dart';
import 'package:poke_datadex/widgets/otherDetails/graphicsCard.dart';
import 'package:poke_datadex/widgets/otherDetails/trainingCard.dart';
import 'package:poke_datadex/widgets/typeChip.dart';

class OtherDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GraphicsCard(),
          const SizedBox(height: 8),
          BreedingCard(),
          const SizedBox(height: 8),
          TrainingCard()
        ],
      ),
    );
  }
}
