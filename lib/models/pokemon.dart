class Pokemon {
  final int id;
  final String name;
  final String spriteUrl;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.spriteUrl,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      spriteUrl: json['sprites']["other"]["official-artwork"][
          "front-default"], //"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png"
      types: (json['types'] as List)
          .map((type) => type['type']['name'] as String)
          .toList(),
    );
  }

  String get capitalizedName => name[0].toUpperCase() + name.substring(1);
}
