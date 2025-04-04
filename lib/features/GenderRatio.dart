class PokemonGender {
  final int genderRate; // -1 (genderless), 0-8 (female chance in eighths)

  PokemonGender({required this.genderRate});

  bool get isGenderless => genderRate == -1;

  double get femaleRatio {
    if (isGenderless) return 0.0;
    return genderRate / 8;
  }

  double get maleRatio {
    if (isGenderless) return 0.0;
    return 1.0 - femaleRatio;
  }

  @override
  String toString() {
    if (isGenderless) {
      return "Genderless Pokemon";
    }
    return "Female: $femaleRatio, Male: $maleRatio";
  }
}
