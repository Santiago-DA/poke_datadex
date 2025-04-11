import 'package:flutter/material.dart';
import 'package:poke_datadex/widgets/statsDetails/statsCard.dart';
import 'package:poke_datadex/widgets/statsDetails/typesDefenses.dart';

class StatsDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        PokemonStatsBarChart(),
        const SizedBox(height: 8),
        TypeDefences(),
      ],
    ));
  }
}
