import 'package:flutter/material.dart';

// Dark Green Color Palette
const Color darkPrimary = Color(0xFF81C784); // Soft green (Primary)
const Color darkPrimaryVariant = Color(0xFF4CAF50); // Medium green
const Color darkSecondary = Color(0xFFA5D6A7); // Light green (Accent)
const Color darkSecondaryVariant = Color(0xFF66BB6A);
const Color darkBackground = Color(0xFF121212); // Dark background
const Color darkSurface = Color(0xFF1E1E1E); // Elevated surfaces
const Color darkError = Color(0xFFCF6679); // Soft red/pink
const Color darkOnPrimary = Color(0xFF000000); // Black text/icons
const Color darkOnSecondary = Color(0xFF000000); // Black text/icons
const Color darkOnBackground = Color(0xFFFFFFFF); // White text
const Color darkOnSurface = Color(0xFFFFFFFF); // White text
const Color darkOnError = Color(0xFF000000); // Black text
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: darkPrimary,
    primaryContainer: darkPrimaryVariant,
    secondary: darkSecondary,
    secondaryContainer: darkSecondaryVariant,
    background: darkBackground,
    surface: darkSurface,
    error: darkError,
    onPrimary: darkOnPrimary,
    onSecondary: darkOnSecondary,
    onBackground: darkOnBackground,
    onSurface: darkOnSurface,
    onError: darkOnError,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: darkSecondary,
    foregroundColor: darkOnSecondary,
  ),
  // Text Styles
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white, // High contrast
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.white70, // Slightly muted
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      color: Colors.white60, // Button text
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkPrimary, // Soft green
      foregroundColor: darkOnPrimary,
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: darkSurface, // Matches surface
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(12)),
    ),
  ),
  // Icons
  iconTheme: const IconThemeData(
    color: darkPrimary, // Soft green icons
  ),
  listTileTheme: ListTileThemeData(
    tileColor: darkSurface,
    selectedTileColor: darkSurface.withOpacity(0.2),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
