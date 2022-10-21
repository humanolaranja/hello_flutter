import 'package:dio/dio.dart';
import 'package:hello_flutter/entities/pokemon.dart';
import 'package:hello_flutter/entities/pokemon_details.dart';

Future<List<Pokemon>> fetchPokemons() async {
  String url = "https://pokeapi.co/api/v2/pokemon";
  final response = await Dio().get(url);

  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = response.data;
    List<dynamic> results = responseJson["results"];

    return results.map((m) => Pokemon.fromJson(m)).toList();
  } else {
    throw Exception('Failed to load pokemons');
  }
}

Future<PokemonDetails> fetchPokemon(String url) async {
  final response = await Dio().get(url);

  if (response.statusCode == 200) {
    return PokemonDetails.fromJson(response.data);
  } else {
    throw Exception('Failed to load pokemon image');
  }
}
