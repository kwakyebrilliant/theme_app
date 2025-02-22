import 'package:flutter/material.dart';
import 'package:flutter_theme/theme/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  bool isSwitched = false;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    loadSwitchState();
  }

  void loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  void saveSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Theme App"),
            IconButton(
              onPressed: () {
                setState(() {
                  // saveSwitchState();
                  themeNotifier.toggleTheme();
                  isDarkMode = !isDarkMode;
                });
              },
              icon:
                  isDarkMode
                      ? Icon(Icons.light_mode_outlined)
                      : Icon(Icons.dark_mode_outlined),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      // Icon as background
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.search,
                            size: 100.0,
                            color: Colors.amber.withValues(alpha: 0.6),
                          ),
                        ),
                      ),

                      Center(
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 62.0,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Text('data'),
          ),
        ],
      ),
    );
  }
}
