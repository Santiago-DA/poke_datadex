import 'package:poke_datadex/models/ability.dart';

import 'pokemonTypes.dart';

class Pokemon {
  final int id;
  final String name;
  final List<PokemonType> types;
  final String imageUrl;
  final Map<String, dynamic> json;
  final List<Ability> abilities;
  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.imageUrl,
    required this.json,
    required this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List)
        .map((type) => PokemonType.fromString(type['type']['name']))
        .whereType<PokemonType>()
        .toList();
    List<Ability> aux = [];
    for (var ability in json["abilities"]) {
      aux.add(
        Ability(
          name: ability["ability"]["name"],
          isHidden: ability["is_hidden"],
        ),
      );
    }
    return Pokemon(
        id: json['id'],
        name: json['name'],
        imageUrl: json['sprites']['other']["official-artwork"]["front_default"],
        types: types,
        json: json,
        abilities: aux);
  }
  Pokemon.empty()
      : id = 0,
        name = "",
        types = [],
        imageUrl = "",
        json = {"": ""},
        abilities = [];

  //String get description => json[];
  String get capitalizedName =>
      name[0].toUpperCase() + name.substring(1).toLowerCase();
}
