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

  // list
  final List<Map<String, dynamic>> iconList = [
    {'name': 'Bookmarks', 'icon': Icons.favorite_rounded},
    {'name': 'Reading List', 'icon': Icons.list_rounded},
    {'name': 'Recent Tabs', 'icon': Icons.tab_rounded},
    {'name': 'History', 'icon': Icons.history_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      // Appba starts here
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        // Title items wrapped in a row
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Theme app text here
            Text(
              "Theme App",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
            ),

            // Icon Button for both light and dark mode
            IconButton(
              onPressed: () {
                setState(() {
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
      // Appbar ends here

      // Body starts here
      body: Column(
        children: [
          // Padding around a row
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            // Row containing icon and search text using stack widget inside a sizedbox
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox here
                SizedBox(
                  width: MediaQuery.of(context).size.width,

                  // Stack here
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

                      // Search text centered
                      Center(
                        // Search Text here
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

          // Padding around row for Textformfield and container
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
            child: Row(
              children: [
                // Expanded for both textfomfield
                Expanded(
                  // Textformfield here
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.mic_rounded, color: Colors.blue),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                    ),
                  ),
                ),

                // Container for search icon
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Center(child: Icon(Icons.search, color: Colors.blue)),
                ),
              ],
            ),
          ),

          // Padding around the row for icon list
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),

            // Row for icon list
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  iconList.map((list) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue.withValues(alpha: 0.2),
                          ),
                          child: Icon(
                            list['icon'],
                            size: 28.0,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          list['name'],
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
