import 'package:flutter/material.dart';

import 'widgets/confirm_alert.dart'; 

void main() {
  runApp(MyApp()); // run app
}

class MyApp extends StatelessWidget { // my app
  const MyApp({super.key}); // my app constructor

  @override
  Widget build(BuildContext context) { // build method
    return MaterialApp( // material app
      title: 'My Notes', // title of the app
      home: const NotesPage(), // home page
    );
  }
}

// notes page class extends stateful widget
class NotesPage extends StatefulWidget { 
  const NotesPage({super.key}); // notes page constructor

  @override
  State<NotesPage> createState() => _NotesPageState(); // create state
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
    // if confirmed, set the note to null
    if (confirmed) {
      setState(() => note = null); 
    }
  }
// build method to build the notes page
  @override 
  Widget build(BuildContext context) {
    return Scaffold( // scaffold widget to display the notes page
      appBar: AppBar(title: const Text('My Notes')), // app bar widget to display the title of the notes page
      body: Padding( // padding widget to display the notes page
        padding: const EdgeInsets.all(24),
        child: note == null // if note is null, display the text 'No notes yet.'
            ? const Center(child: Text('No notes yet.')) // center widget to display the text 'No notes yet.'
            : Card( // card widget to display the note
                child: ListTile( // list tile widget to display the note
                  title: Text(note!), // text widget to display the note
                  trailing: IconButton( // icon button widget to display the delete icon
                    icon: const Icon(Icons.delete_outline),
                    onPressed: _deleteNote, // on pressed
                  ), // icon button widget to display the delete icon 
                ),
              ),
      ),
    );
  }
}
