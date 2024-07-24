import 'package:brightpath/models/quote_model.dart';
import 'package:flutter/material.dart';


void showQuotePopup(BuildContext context) {
  final randomQuote = (quotes..shuffle()).first;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Inspirational Quote'),
        content: Text(randomQuote.text),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
