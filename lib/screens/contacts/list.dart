import 'package:flutter/material.dart';

// 1 - Move dashboard to its own file
// 2 - Create ContactList widget
// 3 - Change the home screen to ContactList

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
    );
  }
}
