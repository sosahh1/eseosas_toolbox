import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final Function(bool) onThemeChanged;
  final ThemeMode currentMode;

  const SettingsPage({super.key, required this.onThemeChanged, required this.currentMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Switch between light and dark themes'),
            value: currentMode == ThemeMode.dark,
            onChanged: onThemeChanged,
            secondary: const Icon(Icons.nightlight_round),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Developer'),
            subtitle: Text('Osaigbovo Eseosa'),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Version'),
            subtitle: Text('1.0.0 (Stable)'),
          ),
        ],
      ),
    );
  }
}