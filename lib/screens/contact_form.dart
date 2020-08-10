import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full name',
              ),
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account number',
                ),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: CreateButton(
                  _nameController,
                  _accountNumberController,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CreateButton extends StatelessWidget {
  final TextEditingController _nameController;
  final TextEditingController _accountNumberController;

  CreateButton(
    this._nameController,
    this._accountNumberController,
  );

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('Create'),
        onPressed: () {
          final String name = _nameController.text;
          final int accountNumber = int.tryParse(_accountNumberController.text);
          if (name != null && accountNumber != null) {
            final Contact newContact = Contact(name, accountNumber);
            Navigator.pop(context, newContact);
          } else {
            final snackBar = SnackBar(content: Text('Invalid values...'));
            Scaffold.of(context).showSnackBar(snackBar);
          }
        });
  }
}
