import 'package:flutter/material.dart';

// Light Green Color Palette
const Color lightPrimary = Color(0xFF2E7D32); // Deep Green (Primary)
const Color lightPrimaryVariant = Color(0xFF1B5E20); // Darker Green
const Color lightSecondary = Color(0xFF4CAF50); // Vibrant Green (Accent)
const Color lightSecondaryVariant = Color(0xFF388E3C);
const Color lightBackground = Color(0xFFFFFFFF); // White
const Color lightSurface = Color(0xFFFAFAFA); // Off-white
const Color lightError = Color(0xFFD32F2F); // Red
const Color lightOnPrimary = Color(0xFFFFFFFF); // White text/icons
const Color lightOnSecondary = Color(0xFFFFFFFF); // White text/icons
const Color lightOnBackground = Color(0xFF000000); // Black text
const Color lightOnSurface = Color(0xFF000000); // Black text
const Color lightOnError = Color(0xFFFFFFFF);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: lightPrimary,
    primaryContainer: lightPrimaryVariant,
    secondary: lightSecondary,
    secondaryContainer: lightSecondaryVariant,
    background: lightBackground,
    surface: lightSurface,
    error: lightError,
    onPrimary: lightOnPrimary,
    onSecondary: lightOnSecondary,
    onBackground: lightOnBackground,
    onSurface: lightOnSurface,
    onError: lightOnError,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: lightPrimary,
    foregroundColor: lightOnPrimary,
    elevation: 0,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: lightSecondary,
    foregroundColor: lightOnSecondary,
  ),
  // Text Styles
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black, // Maintains contrast
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.black87,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      color: Colors.black54, // Button text
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightPrimary, // Deep green
      foregroundColor: lightOnPrimary,
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: lightSurface, // Matches surface color
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(12)),
    ),
  ),
  iconTheme: const IconThemeData(
    color: lightPrimary, // Green icons by default
  ),
  listTileTheme: ListTileThemeData(
    tileColor: Color.lerp(lightSecondary, Colors.white, .80),
    selectedTileColor: lightSurface.withOpacity(0.2),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
