import 'package:flutter/material.dart';

abstract class AppTheme {
  static const redColor = Color(0xFFBB2528);
  static const greenColor = Color(0xFF165B33);
  static const lightGreen =Color.fromARGB(255, 24, 121, 65);
  static const yellowColor = Color.fromARGB(255, 241, 165, 13);
  static const blueColor = Color.fromARGB(255, 42, 130, 189);
  static const whiteColor = Colors.white;

  static const double extraLargeSize = 34.00;
  static const double largeSize = 26.00;
  static const double mediumSize = 20.00;
  static const double smallSize = 16.00;

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'christmas',
      scaffoldBackgroundColor: whiteColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: redColor,
        primary: redColor,
        secondary: greenColor,
        tertiary: yellowColor,
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          fontSize: extraLargeSize,
        ),
        titleMedium: TextStyle(
          fontSize: largeSize,
        ),
        bodyMedium: TextStyle(
          fontSize: mediumSize,
        ),
        bodySmall: TextStyle(
          fontSize: smallSize,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: greenColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: yellowColor,
          fontSize: extraLargeSize,
          fontFamily: 'christmas',
          fontWeight: FontWeight.w700
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: whiteColor,
        
      )
    );
  }
}
