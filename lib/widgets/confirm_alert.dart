import 'package:flutter/material.dart';

Future<bool> showConfirmAlert({ // confirm alert widget
  required BuildContext context, 
  required String title, // title of the alert
  required String message, // message of the alert
  String confirmLabel = 'Confirm', // confirm label
  String cancelLabel = 'Cancel', // cancel label
}) async { // show confirm alert
  final result = await showDialog<bool>( // show dialog
    context: context, // context of the alert
    barrierDismissible: false, // barrier dismissible
    builder: (context) => AlertDialog( // alert dialog
      title: Text(title), // title of the alert
      content: Text(message), // message of the alert
      actions: [ // actions of the alert
        TextButton(
          onPressed: () => Navigator.of(context).pop(false), // on pressed
          child: Text(cancelLabel), // cancel label
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true), // on pressed
          child: Text(confirmLabel), // confirm label
        ),
      ],
    ),
  );

  return result ?? false;
}
