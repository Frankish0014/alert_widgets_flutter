import 'package:flutter/material.dart';

import 'widgets/confirm_alert.dart'; // This file contains the function to show the confirm alert. 

void main() { 
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget { // main app widget. This is the root widget of the app. 
  const MyApp({super.key}); // constructor for the main app widget. 

  @override
  Widget build(BuildContext context) { // build the main app widget. 
    return MaterialApp( // return the main app widget. 
      title: 'Confirm Alert Demo', 
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)), // set the theme of the app. 
      home: const DemoPage(), // set the home page of the app. 
    );
  }
}

class DemoPage extends StatefulWidget { // demo page widget. This is the page that will be displayed when the app is launched. 
  const DemoPage({super.key}); // constructor for the demo page widget. 

  @override
  State<DemoPage> createState() => _DemoPageState(); // create the state for the demo page widget. 
}

class _DemoPageState extends State<DemoPage> { // state for the demo page widget. 
  String status = 'No action taken yet.'; // status of the demo page widget. 

  Future<void> _deleteItem() async {  // function to delete an item. 
    final confirmed = await showConfirmAlert( // show the confirm alert. 
      context: context, // context of the app. 
      title: 'Delete item?', // title of the alert. 
      message: 'Are you sure you want to delete this item? This cannot be undone.', // message of the alert. 
    );

    setState(() { // set the state of the demo page widget. 
      status = confirmed ? 'Item deleted.' : 'Action cancelled.'; // set the status of the demo page widget. 
    });
  }

  @override
  Widget build(BuildContext context) { // build the demo page widget. 
    return Scaffold( // return the demo page widget. 
      appBar: AppBar(title: const Text('Confirm Alert Demo')), // set the app bar of the demo page widget. 
      body: Padding( // padding for the demo page widget. 
        padding: const EdgeInsets.all(24), // padding for the demo page widget. 
        child: Column( // column for the demo page widget. 
          mainAxisAlignment: MainAxisAlignment.center, // main axis alignment for the demo page widget. 
          crossAxisAlignment: CrossAxisAlignment.stretch, // cross axis alignment for the demo page widget. 
          children: [ // children for the demo page widget. 
            const Text( // text for the demo page widget. 
              'Tap the button below. A popup will ask you to confirm before proceeding.', // text for the demo page widget. 
              textAlign: TextAlign.center, // text align for the demo page widget. 
              style: TextStyle(fontSize: 18), // style for the demo page widget. 
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: _deleteItem,
              icon: const Icon(Icons.delete_outline),
              label: const Text('Delete Item'),
            ),
            const SizedBox(height: 24),
            Text(
              status,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
