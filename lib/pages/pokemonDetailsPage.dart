import 'package:flutter/material.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'mainDetailsPage.dart';
import 'statsDetailsPage.dart';
import 'movesDetailsPage.dart';
import 'otherDetailsPage.dart';

class PokemonDetailsPage extends StatefulWidget {
  Pokemon pokemon;
  PokemonDetailsPage({required this.pokemon});

  @override
  _PokemonDetailsPage createState() => _PokemonDetailsPage();
}

class _PokemonDetailsPage extends State<PokemonDetailsPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    MainDetailsPage(),
    StatsDetailsPage(),
    MovesDetailsPage(),
    OtherDetailsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
      ),
      body: SingleChildScrollView(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "main",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: "stats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: "moves",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "other",
          ),
        ],
      ),
    );
  }
}
