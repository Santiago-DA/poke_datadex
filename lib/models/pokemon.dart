import 'pokemonTypes.dart';

class Pokemon {
  final int id;
  final String name;
  final List<PokemonType> types;
  final String imageUrl;
  final Map<String, dynamic> json;
  Pokemon(
      {required this.id,
      required this.name,
      required this.types,
      required this.imageUrl,
      required this.json});

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
        json: json);
  }
  Pokemon.empty()
      : id = 0,
        name = "",
        types = [],
        imageUrl = "",
        json = {"": ""};

  //String get description => json[];
  String get capitalizedName =>
      name[0].toUpperCase() + name.substring(1).toLowerCase();
}
