import 'package:flutter/material.dart';

ThemeData tema() {
  return ThemeData(
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          shadowColor: MaterialStatePropertyAll((Colors.white)),
          backgroundColor: MaterialStatePropertyAll(Colors.black)),
    ),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    ),
  );
}
