import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  Set<int> _favoriteIds = {};
  static const String _prefsKey = 'favorites';

  Set<int> get favorites => _favoriteIds;

  FavoritesProvider() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_prefsKey) ?? [];
    _favoriteIds.addAll(saved.map(int.parse).toSet());
    notifyListeners();
  }

  Future<void> toggleFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
      var ls = _favoriteIds.toList();
      ls.sort();
      _favoriteIds = ls.toSet();
    } else {
      _favoriteIds.add(id);
      var ls = _favoriteIds.toList();
      ls.sort();
      _favoriteIds = ls.toSet();
    }
    await prefs.setStringList(
      _prefsKey,
      _favoriteIds.map((id) => id.toString()).toList(),
    );
    notifyListeners();
  }

  bool isFavorite(int id) => _favoriteIds.contains(id);
}
