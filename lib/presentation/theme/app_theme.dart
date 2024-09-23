import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor:  Colors.indigo[900],
  brightness: Brightness.light,
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.grey, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.grey, fontSize: 20),
    bodyLarge: TextStyle(color: Colors.grey, fontSize: 24),
    titleSmall: TextStyle(color: Colors.black, fontSize: 16),
    titleMedium: TextStyle(color: Colors.black, fontSize: 20),
    titleLarge: TextStyle(color: Colors.black, fontSize: 24),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.indigo[900],
    foregroundColor: Colors.white,
  ),
  buttonTheme:  ButtonThemeData(
    buttonColor: Colors.indigo[900],
    textTheme: ButtonTextTheme.primary,
  ),
  // Add more theming options here as needed.
);