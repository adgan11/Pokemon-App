import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crash_course/pokemon_page.dart';

import 'pokemon_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Crash Course',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List pokemons = [];
  var darkMode = false;

  Future<void> fetchData() async {
    final String response =
        await rootBundle.loadString("./lib/pokemon-data.json");
    final data = await jsonDecode(response);
    setState(() {
      pokemons = data["pokemons"];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pokedex",
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          runSpacing: 20,
          children: [
            ...pokemons
                .map(
                  (e) => PokemonCard(
                    imageUrl: e["imageUrl"],
                    pokemonName: e["name"],
                    pokemonDesc: e["description"],
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
