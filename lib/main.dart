import 'package:flutter/material.dart';

import 'widgets/confirm_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      home: const NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  String? note = 'Buy groceries after today mobile dev lesson';

  Future<void> _deleteNote() async {
    final confirmed = await showConfirmAlert(
      context: context,
      title: 'Delete note?',
      message: 'This note will be permanently removed.',
      confirmLabel: 'delete',
    );
    
    if (confirmed) {
      setState(() => note = null); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Notes')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: note == null
            ? const Center(child: Text('No notes yet.'))
            : Card(
                child: ListTile(
                  title: Text(note!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: _deleteNote,
                  ),
                ),
              ),
      ),
    );
  }
}
