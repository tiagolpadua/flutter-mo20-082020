import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String) onConfirm;

  TransactionAuthDialog({
    @required this.onConfirm,
  });

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: 4,
        style: TextStyle(
          fontSize: 64,
          letterSpacing: 24,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            print('cancel');
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
            widget.onConfirm(_passwordController.text);
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
