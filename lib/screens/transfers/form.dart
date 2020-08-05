import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatefulWidget {
  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberFieldController =
  TextEditingController();

  final TextEditingController _valueFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const _appBarTitle = 'Creating Transfer';

    const _labelFieldAccount = 'Account number';
    const _hintFieldAccount = '00000';

    const _labelFieldValue  = 'Value';
    const _hintFieldValue = '0.00';

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _accountNumberFieldController,
              label: _labelFieldAccount,
              hint: _hintFieldAccount,
            ),
            Editor(
                controller: _valueFieldController,
                label: _labelFieldValue,
                hint: _hintFieldValue,
                icon: Icons.monetization_on),
            RaisedButton(
              child: Text('Confirm'),
              onPressed: () => _createTransfer(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberFieldController.text);
    final double value = double.tryParse(_valueFieldController.text);
    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
      debugPrint('$createdTransfer');
      Navigator.pop(context, createdTransfer);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    debugPrint('TransferForm dispose');
    _accountNumberFieldController.dispose();
    _valueFieldController.dispose();
    super.dispose();
  }
}