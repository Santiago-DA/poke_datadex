import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeApiManager {
  static const baseUrl = "https://pokeapi.co/api/v2/";

  //get pokemon list
  Future<Map<String, dynamic>> getPokemonList(
      {int limit = 20, int offset = 0}) async {
    final response = await http.get(
      Uri.parse('${baseUrl}pokemon?limit=$limit&offset=$offset'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Pokémon list');
    }
  }

  //get details about pokemon
  Future<Map<String, dynamic>> getPokemonDetails(dynamic identifier) async {
    final response = await http.get(
      Uri.parse('${baseUrl}pokemon/$identifier'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Pokémon details');
    }
  }

  // Get Pokémon species data
  Future<Map<String, dynamic>> getPokemonSpecies(dynamic identifier) async {
    final response = await http.get(
      Uri.parse('${baseUrl}pokemon-species/$identifier'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Pokémon species');
    }
  }

  Future<Map<String, dynamic>> getAbilityDetails(dynamic identifier) async {
    final response = await http.get(
      Uri.parse('${baseUrl}ability/$identifier'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load ability details');
    }
  }

  // Get type details
  Future<Map<String, dynamic>> getTypeDetails(dynamic identifier) async {
    final response = await http.get(
      Uri.parse('${baseUrl}type/$identifier'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load type details');
    }
  }
}
