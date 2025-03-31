import 'pokemonTypes.dart';

class Pokemon {
  final int id;
  final String name;
  final List<PokemonType> types;
  final String imageUrl;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.imageUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List)
        .map((type) => PokemonType.fromString(type['type']['name']))
        .whereType<PokemonType>()
        .toList();
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']["official-artwork"]["front_default"],
      types: types,
    );
  }
}
