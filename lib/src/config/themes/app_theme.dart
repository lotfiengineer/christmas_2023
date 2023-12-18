import 'package:flutter/material.dart';

abstract class AppTheme {
  static const redColor = Color(0xFFBB2528);
  static const greenColor = Color(0xFF165B33);
  static const yellowColor = Color(0xFFF8B229);
  static const blueColor = Color.fromARGB(255, 42, 130, 189);
  static const whiteColor = Colors.white;

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      fontFamily: '',
      scaffoldBackgroundColor: whiteColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: redColor,
        primary: redColor,
        secondary: greenColor,
        tertiary: yellowColor,
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          fontSize: 32,
        ),
        titleMedium: TextStyle(
          fontSize: 22,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: greenColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: whiteColor,
      )
    );
  }
}
