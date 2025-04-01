import 'package:flutter/material.dart';
import 'package:poke_datadex/pages/homePage.dart';
import 'package:provider/provider.dart';
import 'package:poke_datadex/Themes/themeProvider.dart';
import 'package:poke_datadex/Themes/themes.dart';
import 'package:poke_datadex/features/pokeAPI.dart';
import "package:poke_datadex/features/favoritePokemons.dart";

Future<void> main() async {
  var api = PokeApiManager();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeProvider.themeMode,
      home: HomePage(),
    );
  }
}
