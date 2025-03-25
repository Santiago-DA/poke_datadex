import 'package:flutter/material.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue.shade800,
    colorScheme: ColorScheme.light(
      primary: Colors.blue.shade800,
      secondary: Colors.orange.shade600,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade800,
      foregroundColor: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue.shade300,
    colorScheme: ColorScheme.dark(
      primary: Colors.blue.shade300,
      secondary: Colors.orange.shade300,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
    ),
  );
}
