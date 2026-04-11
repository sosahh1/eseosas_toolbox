import 'package:flutter/material.dart';
import 'converter_page.dart';
import 'currency_page.dart';
import 'notes_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  final Function(bool) onThemeChanged;
  final ThemeMode currentMode;

  const HomePage({super.key, required this.onThemeChanged, required this.currentMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eseosa's Toolbox"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          _buildCard(context, 'Converters', Icons.auto_graph, const MultiConverterPage()),
          _buildCard(context, 'NGN Currency', Icons.payments, const CurrencyPage()),
          _buildCard(context, 'My Notes', Icons.edit_note, const NotesPage()),
          _buildCard(context, 'Settings', Icons.settings, SettingsPage(onThemeChanged: onThemeChanged, currentMode: currentMode)),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Widget target) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => target)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}