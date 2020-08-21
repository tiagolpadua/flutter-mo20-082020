import 'package:bytebank/models/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';
import 'http/webclient.dart';
import 'models/transaction.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(BytebankApp());
//  save(Transaction(200.0, Contact(0, 'Gui', 2000)))
//
//  // New code
//  .then((transaction) {
//    debugPrint('>>>>>>>>>>>>>>>>>');
//    debugPrint('$transaction');
//  });
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
