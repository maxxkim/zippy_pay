import 'package:flutter/material.dart';

final ThemeData appThemeDark = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  primaryColor:  Color.fromARGB(255, 126, 26, 111),
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.grey, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.grey, fontSize: 20),
    bodyLarge: TextStyle(color: Colors.grey, fontSize: 24),
    titleSmall: TextStyle(color: Colors.black, fontSize: 16),
    titleMedium: TextStyle(color: Colors.black, fontSize: 20),
    titleLarge: TextStyle(color: Colors.black, fontSize: 24),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor:  Color.fromARGB(255, 126, 26, 111),
    foregroundColor: Colors.white,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color.fromARGB(255, 126, 26, 111),
    textTheme: ButtonTextTheme.primary,
  ),
  // Add more theming options here as needed.
);