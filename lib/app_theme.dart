import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Color(0xFF2E4600), // Dark green
      colorScheme: ColorScheme.light(
        primary: Color(0xFF2E4600),
        secondary: Color(0xFFD9B26F), // Tan
        background: Color(0xFFF0EAD6), // Light cream
      ),
      scaffoldBackgroundColor: Color(0xFFF0EAD6),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF2E4600),
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: Color(0xFF2E4600),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: Color(0xFF3A3A3A),
          fontSize: 16,
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white.withOpacity(0.8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFFD9B26F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}