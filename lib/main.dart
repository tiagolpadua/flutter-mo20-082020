import 'package:bytebank/models/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';
import 'screens/dashboard.dart';

// 1 - Adjust the return type of save method
// 2 - Add some test code in main.dart
// 3 - Remove id when persisting the contact

void main() {
  runApp(BytebankApp());
//  save(Contact(0, 'alex', 1000)).then(
//    (id) {
//      findAll().then(
//        (contacts) {
//          debugPrint(contacts.toString());
//        },
//      );
//    },
//  );
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
