import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF000000),
    inversePrimary: Color(0xFFFFFFFF),
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: const Color(0xFFFFFFFF),
    displayColor: const Color(0xFFFFFFFF),
  ),
);
