import 'package:flutter/material.dart';
import 'package:poke_datadex/models/pokemon.dart';
import 'package:provider/provider.dart';

class CurrentPokemonProvider extends ChangeNotifier {
  Pokemon _pokemon = Pokemon.empty();

  Pokemon get currentPokemon => _pokemon;

  void updateCurrent(Pokemon newPkm) {
    _pokemon = newPkm;
    notifyListeners();
  }

  void clearCurrent() {
    _pokemon = Pokemon.empty();
    notifyListeners();
  }
}
