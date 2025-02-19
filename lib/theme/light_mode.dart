import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFF7F7FA),
    inversePrimary: Color(0xFF000000),
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: const Color(0xFF000000),
    displayColor: const Color(0xFF000000),
  ),
);
