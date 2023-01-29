import 'package:flutter/material.dart';

import 'pokemon_page.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.imageUrl,
    required this.pokemonName,
    required this.pokemonDesc,
  });

  final String imageUrl;
  final String pokemonName;
  final String pokemonDesc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonPage(
              pokemonImage: imageUrl,
              pokemonName: pokemonName,
              pokemonDesc: pokemonDesc,
            ),
          ),
        );
      },
      child: Center(
        child: Material(
          elevation: 20,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height - 540,
            child: Column(
              children: [
                Center(
                  child: Image.network(
                    imageUrl,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    pokemonName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      background: Paint()
                        ..color = Colors.grey.withOpacity(.5)
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 48
                        ..strokeJoin = StrokeJoin.round,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
