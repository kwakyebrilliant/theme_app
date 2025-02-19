import 'package:flutter/material.dart';
import 'package:flutter_theme/screen.dart';
import 'package:flutter_theme/theme/dark_mode.dart';
import 'package:flutter_theme/theme/light_mode.dart';
import 'package:flutter_theme/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Builder(
        builder: (context) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: darkMode,
      theme: lightMode,
      themeMode:
          themeNotifier.currentTheme == lightMode
              ? ThemeMode.light
              : ThemeMode.dark,
      home: Screen(),
    );
  }
}
