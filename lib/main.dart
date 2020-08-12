import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'models/contact.dart';
import 'models/transaction.dart';

void main() {
  runApp(BytebankApp());
  save(Transaction(200.0, Contact(0, 'Gui', 2000)))
      .then((transaction) => print(transaction));
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: bytebankTheme(),
      home: Dashboard(),
    );
  }
}

ThemeData bytebankTheme() {
  return ThemeData(
    primaryColor: Colors.green[900],
    accentColor: Colors.blueAccent[700],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueAccent[700],
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
