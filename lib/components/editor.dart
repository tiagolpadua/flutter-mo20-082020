import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool hasError;

  Editor({this.controller, this.label, this.hint, this.icon, this.hasError});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label + '$hasError',
          hintText: hint,
          focusedBorder: new OutlineInputBorder(
            borderSide:
                new BorderSide(color: hasError ? Colors.red : Colors.teal),
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
