import 'package:flutter/material.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({
    super.key,
    required this.pokemonImage,
    required this.pokemonName,
    required this.pokemonDesc,
  });

  final String pokemonImage;
  final String pokemonName;
  final String pokemonDesc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemonName,
        ),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(
              pokemonImage,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            pokemonName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 54,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              pokemonDesc,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 60,
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              child: const Text(
                "More Info",
                style: TextStyle(fontSize: 28),
              ),
            ),
          )
        ],
      ),
    );
  }
}
