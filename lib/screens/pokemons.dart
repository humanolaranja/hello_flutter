import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello_flutter/entities/pokemon.dart';
import 'package:hello_flutter/routes.dart';
import 'package:hello_flutter/service/pokemons.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({Key? key}) : super(key: key);

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  Future<List<Pokemon>>? futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
      ),
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: futurePokemon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Pokemon item = snapshot.data![index];

                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, Routes.pokemonDetailsPagePath, arguments: Pokemon(name: item.name, url: item.url)),
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Container(
                          alignment: Alignment.center,
                          child: Hero(
                            tag: item.name,
                            child: Material(
                              child: Text(
                                item.name,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      )),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
