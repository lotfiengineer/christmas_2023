import 'package:flutter/material.dart';

abstract class AppTheme {
  static const redColor = Color(0xFFBB2528);
  static const greenColor = Color(0xFF165B33);
  static const lightGreen = Color(0xFF187941);
  static const superLightGreen = Color.fromARGB(162, 24, 154, 78);
  static const yellowColor = Color(0xFFF1A50D);
  static const lightYelllow = Color.fromARGB(255, 247, 193, 85);
  static const blueColor = Color(0xFF2A82BD);
  static const lightBlue = Color.fromARGB(182, 27, 128, 195);
  static const whiteColor = Colors.white;
  static const lightWhiteColor = Color.fromARGB(226, 255, 255, 255);
  static const superLightWhiteColor = Color.fromARGB(184, 255, 255, 255);

  static const transparentGreenColor = Color.fromARGB(120, 22, 91, 51);
  static const transparentBlueColor = Color.fromARGB(120, 42, 130, 189);

  static const double extraLargeSize = 34.00;
  static const double largeSize = 26.00;
  static const double mediumSize = 20.00;
  static const double smallSize = 16.00;

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'christmas',
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
        seedColor: redColor,
        primary: redColor,
        secondary: greenColor,
        tertiary: yellowColor,
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          fontSize: extraLargeSize,
          color: lightWhiteColor,
        ),
        titleMedium: TextStyle(
          fontSize: largeSize,
          color: lightWhiteColor,
        ),
        bodyMedium: TextStyle(
          fontSize: mediumSize,
          color: lightWhiteColor,
        ),
        bodySmall: TextStyle(
          fontSize: smallSize,
          color: lightWhiteColor,
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: yellowColor,
            fontSize: extraLargeSize,
            fontFamily: 'christmas',
            fontWeight: FontWeight.w700),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
        )
      ),
      dialogBackgroundColor: superLightGreen,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: whiteColor,
      ),
    );
  }
}
