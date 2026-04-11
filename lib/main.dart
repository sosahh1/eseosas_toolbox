// Project: Eseosa's Toolbox
// Dev: Osaigbovo Eseosa
// Logic: Main entry point with Theme State Management

import 'package:flutter/material.dart';
import 'screens/home_page.dart'; // Import your custom screen folder

void main() {
  runApp(const EseosaToolboxApp());
}

class EseosaToolboxApp extends StatefulWidget {
  const EseosaToolboxApp({super.key});

  @override
  State<EseosaToolboxApp> createState() => _EseosaToolboxAppState();
}

class _EseosaToolboxAppState extends State<EseosaToolboxApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Eseosa's Toolbox",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: _themeMode,
      home: HomePage(onThemeChanged: _toggleTheme, currentMode: _themeMode),
    );
  }
}