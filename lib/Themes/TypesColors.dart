import 'dart:ui';

class PokemonTypeColors {
  static const normal = Color(0xFFA8A77A);
  static const fire = Color(0xFFEE8130);
  static const water = Color(0xFF6390F0);
  static const electric = Color(0xFFF7D02C);
  static const grass = Color(0xFF7AC74C);
  static const ice = Color(0xFF96D9D6);
  static const fighting = Color(0xFFC22E28);
  static const poison = Color(0xFFA33EA1);
  static const ground = Color(0xFFE2BF65);
  static const flying = Color(0xFFA98FF3);
  static const psychic = Color(0xFFF95587);
  static const bug = Color(0xFFA6B91A);
  static const rock = Color(0xFFB6A136);
  static const ghost = Color(0xFF735797);
  static const dragon = Color(0xFF6F35FC);
  static const dark = Color(0xFF705746);
  static const steel = Color(0xFFB7B7CE);
  static const fairy = Color(0xFFD685AD);

  static Color getColor(String type) {
    switch (type) {
      case 'normal':
        return normal;
      case 'fire':
        return fire;
      case 'water':
        return water;
      case 'electric':
        return electric;
      case 'grass':
        return grass;
      case 'ice':
        return ice;
      case 'fighting':
        return fighting;
      case 'poison':
        return poison;
      case 'ground':
        return ground;
      case 'flying':
        return flying;
      case 'psychic':
        return psychic;
      case 'bug':
        return bug;
      case 'rock':
        return rock;
      case 'ghost':
        return ghost;
      case 'dragon':
        return dragon;
      case 'dark':
        return dark;
      case 'steel':
        return steel;
      case 'fairy':
        return fairy;
      default:
        return normal;
    }
  }
}
