import 'package:flutter/material.dart';
import 'package:poke_datadex/pages/homePage.dart';
import 'package:provider/provider.dart';
import 'package:poke_datadex/Themes/themeProvider.dart';
import 'package:poke_datadex/Themes/themes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
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
