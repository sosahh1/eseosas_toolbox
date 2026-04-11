import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<String> _notes = [];
  final _controller = TextEditingController();

  void _addNote() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _notes.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quick Notes')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller, decoration: const InputDecoration(hintText: 'New entry...'))),
                IconButton(icon: const Icon(Icons.add_task, color: Colors.teal, size: 30), onPressed: _addNote),
              ],
            ),
          ),
          Expanded(
            child: _notes.isEmpty 
              ? const Center(child: Text('No notes yet!'))
              : ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (ctx, i) => Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: ListTile(
                      title: Text(_notes[i]),
                      trailing: IconButton(icon: const Icon(Icons.delete_outline, color: Colors.redAccent), 
                        onPressed: () => setState(() => _notes.removeAt(i))),
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}