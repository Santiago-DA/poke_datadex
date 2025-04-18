import 'package:flutter/material.dart';
import 'package:poke_datadex/pages/favoritesPkmPage.dart';
import 'package:poke_datadex/pages/pokemonListScreen.dart';
import 'package:provider/provider.dart';
import 'package:poke_datadex/Themes/themeProvider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      //floatingActionButton: FloatingActionButton(onPressed: () {}),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                "Opciones",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            ListTile(
              tileColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text("Favorites"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritesPkmPage()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("PokeDataDex"),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              themeProvider.toggleTheme(
                themeProvider.themeMode != ThemeMode.dark,
              );
            },
          ),
        ],
      ),
      body: PokemonScreen(),
    );
  }
}
