import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/pokemon.dart';
import 'package:hello_flutter/screens/pokemons.dart';

class Routes {
  static const String pokemonPagePath = '/';
  static const String pokemonDetailsPagePath = '/pokemon';

  getDefault(args) {
    return {
      pokemonPagePath: (BuildContext context) => const PokemonsPage(),
      pokemonDetailsPagePath: (BuildContext context) => PokemonPage(args),
    };
  }
}
