import 'package:flutter/material.dart';
import 'package:poke_datadex/features/currentPokemonProvider.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:provider/provider.dart';
import "package:fl_chart/fl_chart.dart";

import '../../models/stats.dart';

import 'package:flutter/material.dart';

class PokemonStatsBarChart extends StatelessWidget {
  final Color barColor;

  final double barHeight;
  final double spacing;
  final double maxStatValue;

  const PokemonStatsBarChart({
    Key? key,
    this.barColor = Colors.green,
    this.barHeight = 20.0,
    this.spacing = 8.0,
    this.maxStatValue = 255.0, // Max possible stat value in Pokemon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white70
        : Colors.black;
    Stats stats =
        Provider.of<CurrentPokemonProvider>(context).currentPokemon.stats;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Stats",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 4),
            _buildStatRow('HP', stats.hp, textColor),
            SizedBox(height: spacing),
            _buildStatRow('ATK', stats.attack, textColor),
            SizedBox(height: spacing),
            _buildStatRow('DEF', stats.defence, textColor),
            SizedBox(height: spacing),
            _buildStatRow('Sp.ATK', stats.specialAttack, textColor),
            SizedBox(height: spacing),
            _buildStatRow('Sp.DEF', stats.specialDefence, textColor),
            SizedBox(height: spacing),
            _buildStatRow('SPD', stats.speed, textColor),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, int value, Color textColor) {
    final percentage = value / maxStatValue;
    final clampedPercentage = percentage.clamp(0.0, 1.0);

    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: barHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(barHeight / 2),
                  color: Colors.grey[200],
                ),
              ),
              FractionallySizedBox(
                widthFactor: clampedPercentage,
                child: Container(
                  height: barHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(barHeight / 2),
                    color: barColor,
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      value.toString(),
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
