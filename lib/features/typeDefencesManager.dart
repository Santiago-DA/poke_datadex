import 'TypeTable.dart' show typeTable;
import 'package:poke_datadex/models/pokemonTypes.dart';

class TypeDefences {
  final Set<PokemonType> superWeak;
  final Set<PokemonType> weak;
  final Set<PokemonType> normal;
  final Set<PokemonType> resistant;
  final Set<PokemonType> superResistant;
  final Set<PokemonType> immune;

  TypeDefences({
    required this.superWeak,
    required this.weak,
    required this.normal,
    required this.resistant,
    required this.superResistant,
    required this.immune,
  });
}

TypeDefences getDefenseEffectiveness(PokemonType type1, PokemonType type2) {
  final allTypes = PokemonType.values;
  final superWeak = <PokemonType>{};
  final weak = <PokemonType>{};
  final normal = <PokemonType>{};
  final resistant = <PokemonType>{};
  final superResistant = <PokemonType>{};
  final immune = <PokemonType>{};

  for (final attackType in allTypes) {
    double effectiveness1 = typeTable[type1]?[attackType] ?? 1.0;
    double effectiveness2 = typeTable[type2]?[attackType] ?? 1.0;

    // Handle immunities
    if (effectiveness1 == 0.0 || effectiveness2 == 0.0) {
      immune.add(attackType);
      continue;
    }

    final totalEffectiveness = effectiveness1 * effectiveness2;

    if (totalEffectiveness == 0.0) {
      immune.add(attackType);
    } else if (totalEffectiveness == 0.25) {
      superResistant.add(attackType);
    } else if (totalEffectiveness == 0.5) {
      resistant.add(attackType);
    } else if (totalEffectiveness == 1.0) {
      normal.add(attackType);
    } else if (totalEffectiveness == 2.0) {
      weak.add(attackType);
    } else if (totalEffectiveness == 4.0) {
      superWeak.add(attackType);
    }
  }

  return TypeDefences(
    superWeak: superWeak,
    weak: weak,
    normal: normal,
    resistant: resistant,
    superResistant: superResistant,
    immune: immune,
  );
}
