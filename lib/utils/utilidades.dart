import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String title, String content,
    String buttonText, Function buttonFunction, String cancelButtonText) {
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    child: Text(cancelButtonText),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget actionButton = ElevatedButton(
    child: Text(buttonText),
    onPressed: () {
      buttonFunction();
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      cancelButton,
      actionButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
