enum PokemonType {
  normal,
  fire,
  water,
  electric,
  grass,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy;

  // Convert string to PokemonType (case insensitive)
  static PokemonType? fromString(String type) {
    for (final value in PokemonType.values) {
      if (value.name.toLowerCase() == type.toLowerCase()) {
        return value;
      }
    }
    return null; // Return null if no match found
  }

  // Get capitalized name (e.g., "Fire")
  String get capitalized {
    return name[0].toUpperCase() + name.substring(1);
  }
}
