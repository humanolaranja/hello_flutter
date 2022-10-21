import 'package:hello_flutter/entities/pokemon_details_sprites.dart';

class PokemonDetails {
  final PokemonDetailsSprite sprites;

  PokemonDetails({required this.sprites});

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    return PokemonDetails(sprites: PokemonDetailsSprite.fromJson(json['sprites']));
  }
}
