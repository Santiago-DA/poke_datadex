import 'package:poke_datadex/models/pokemonTypes.dart';

Map<PokemonType, Map<PokemonType, double>> typeTable = {
  //normal
  PokemonType.normal: {
    PokemonType.fighting: 2.0,
    PokemonType.ghost: 0.0,
  },
  //fire
  PokemonType.fire: {
    PokemonType.fire: 0.5,
    PokemonType.water: 2.0,
    PokemonType.grass: 0.5,
    PokemonType.ice: 0.5,
    PokemonType.ground: 2.0,
    PokemonType.bug: 0.5,
    PokemonType.rock: 2.0,
    PokemonType.steel: 0.5,
    PokemonType.fairy: 0.5,
  },
  //water
  PokemonType.water: {
    PokemonType.fire: 0.5,
    PokemonType.water: 0.5,
    PokemonType.electric: 2.0,
    PokemonType.grass: 2.0,
    PokemonType.ice: 0.5,
    PokemonType.steel: 0.5,
  },
  //electric
  PokemonType.electric: {
    PokemonType.electric: 0.5,
    PokemonType.ground: 2.0,
    PokemonType.flying: 0.5,
    PokemonType.steel: 0.5,
  },
  //grass
  PokemonType.grass: {
    PokemonType.fire: 2.0,
    PokemonType.water: 0.5,
    PokemonType.electric: 0.5,
    PokemonType.grass: 0.5,
    PokemonType.ice: 2.0,
    PokemonType.poison: 2.0,
    PokemonType.ground: 0.5,
    PokemonType.flying: 2.0,
    PokemonType.bug: 2.0,
  },
  //ice
  PokemonType.ice: {
    PokemonType.fire: 2.0,
    PokemonType.ice: 0.5,
    PokemonType.fighting: 2.0,
    PokemonType.rock: 2.0,
    PokemonType.steel: 2.0,
  },
  //fighting
  PokemonType.fighting: {
    PokemonType.flying: 2.0,
    PokemonType.psychic: 2.0,
    PokemonType.bug: 0.5,
    PokemonType.rock: 0.5,
    PokemonType.dark: 0.5,
    PokemonType.fairy: 2.0,
  },
  //poison
  PokemonType.poison: {
    PokemonType.grass: 0.5,
    PokemonType.fighting: 0.5,
    PokemonType.poison: 0.5,
    PokemonType.ground: 2.0,
    PokemonType.psychic: 2.0,
    PokemonType.bug: 0.5,
    PokemonType.fairy: 0.5,
  },
  //ground
  PokemonType.ground: {
    PokemonType.water: 2.0,
    PokemonType.electric: 0.0,
    PokemonType.grass: 2.0,
    PokemonType.ice: 2.0,
    PokemonType.poison: 0.5,
    PokemonType.rock: 0.5,
  },
  //flying
  PokemonType.flying: {
    PokemonType.electric: 2.0,
    PokemonType.grass: 0.5,
    PokemonType.ice: 2.0,
    PokemonType.fighting: 0.5,
    PokemonType.ground: 0.0,
    PokemonType.bug: 0.5,
    PokemonType.rock: 2.0,
  },
  //psychic
  PokemonType.psychic: {
    PokemonType.fighting: 0.5,
    PokemonType.psychic: 0.5,
    PokemonType.bug: 2.0,
    PokemonType.ghost: 2.0,
    PokemonType.dark: 2.0,
  },
  //bug
  PokemonType.bug: {
    PokemonType.fire: 2.0,
    PokemonType.grass: 0.5,
    PokemonType.fighting: 0.5,
    PokemonType.ground: 0.5,
    PokemonType.flying: 2.0,
    PokemonType.rock: 2.0,
  },
  //rock
  PokemonType.rock: {
    PokemonType.normal: 0.5,
    PokemonType.fire: 0.5,
    PokemonType.water: 2.0,
    PokemonType.grass: 2.0,
    PokemonType.fighting: 2.0,
    PokemonType.poison: 0.5,
    PokemonType.ground: 2.0,
    PokemonType.flying: 0.5,
    PokemonType.steel: 2.0,
  },
  //ghost
  PokemonType.ghost: {
    PokemonType.normal: 0.0,
    PokemonType.fighting: 0.0,
    PokemonType.poison: 0.5,
    PokemonType.bug: 0.5,
    PokemonType.ghost: 2.0,
    PokemonType.dark: 2.0,
  },
  //dragon
  PokemonType.dragon: {
    PokemonType.fire: 0.5,
    PokemonType.water: 0.5,
    PokemonType.electric: 0.5,
    PokemonType.grass: 0.5,
    PokemonType.ice: 2.0,
    PokemonType.dragon: 2.0,
    PokemonType.fairy: 2.0,
  },
  //dark
  PokemonType.dark: {
    PokemonType.fighting: 2.0,
    PokemonType.psychic: 0.0,
    PokemonType.bug: 2.0,
    PokemonType.ghost: 0.5,
    PokemonType.dark: 0.5,
    PokemonType.fairy: 2.0,
  },
  //steel
  PokemonType.steel: {
    PokemonType.normal: 0.5,
    PokemonType.fire: 2.0,
    PokemonType.grass: 0.5,
    PokemonType.ice: 0.5,
    PokemonType.fighting: 2.0,
    PokemonType.poison: 0.0,
    PokemonType.ground: 2.0,
    PokemonType.flying: 0.5,
    PokemonType.psychic: 0.5,
    PokemonType.bug: 0.5,
    PokemonType.rock: 0.5,
    PokemonType.dragon: 0.5,
    PokemonType.steel: 0.5,
    PokemonType.fairy: 0.5,
  },
  //fairy
  PokemonType.fairy: {
    PokemonType.fighting: 0.5,
    PokemonType.poison: 2.0,
    PokemonType.bug: 0.5,
    PokemonType.dragon: 0.0,
    PokemonType.dark: 0.5,
    PokemonType.steel: 2.0,
  },
};
