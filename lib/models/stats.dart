class Stats {
  final int hp;
  final int attack;
  final int defence;
  final int specialAttack;
  final int specialDefence;
  final int speed;
  Stats({
    required this.hp,
    required this.attack,
    required this.defence,
    required this.specialAttack,
    required this.specialDefence,
    required this.speed,
  });

  Stats.zero()
      : hp = 0,
        attack = 0,
        defence = 0,
        specialAttack = 0,
        specialDefence = 0,
        speed = 0;
  factory Stats.fromJson(Map<String, dynamic> json) {
    // PokeAPI stats come in a specific order in a list
    final statsList = json['stats'] as List;

    return Stats(
      hp: statsList[0]['base_stat'] as int,
      attack: statsList[1]['base_stat'] as int,
      defence: statsList[2]['base_stat'] as int,
      specialAttack: statsList[3]['base_stat'] as int,
      specialDefence: statsList[4]['base_stat'] as int,
      speed: statsList[5]['base_stat'] as int,
    );
  }

  static const List<String> statNames = [
    'HP',
    'Attack',
    'Defense',
    'Special Attack',
    'Special Defense',
    'Speed'
  ];
  static const List<String> shortStatNames = [
    'HP',
    'ATK',
    'DEF',
    'Sp.ATK',
    'Sp.DEF',
    'SD'
  ];

  List<int> get values =>
      [hp, attack, defence, specialAttack, specialDefence, speed];

  Map<String, int> get asMap => {
        "HP": hp,
        "Attack": attack,
        "Defence": defence,
        "Special Attack": specialAttack,
        "Special Defence": specialDefence,
        "Speed": speed,
      };
}
