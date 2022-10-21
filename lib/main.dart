import 'package:flutter/material.dart';
import 'package:hello_flutter/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: Routes.pokemonPagePath,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder = Routes().getDefault(settings.arguments)[settings.name];
        return MaterialPageRoute(builder: (context) => builder(context));
      },
    );
  }
}
