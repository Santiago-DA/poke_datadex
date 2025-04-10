import 'package:flutter/material.dart';
import 'package:poke_datadex/widgets/statsDetails/statsCard.dart';

class StatsDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text("Stats"),
        PokemonStatsBarChart(),
      ],
    ));
  }
}
