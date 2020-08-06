import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData.dark(),
        home: Scaffold(
      body: TransfersList(),
    ));
  }
}

class TransferForm extends StatefulWidget {
  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  bool _isValueFieldValid = false;
  bool _isAccountFieldValid = false;
  bool _isValueFieldDirty = false;
  bool _isAccountFieldDirty = false;

  final TextEditingController _accountNumberFieldController =
      TextEditingController();

  final TextEditingController _valueFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _accountNumberFieldController.addListener(() {
      _validateFields();
    });
    _valueFieldController.addListener(() {
      _validateFields();
    });
  }

  bool _isFormValid() {
    return _isValueFieldValid && _isAccountFieldValid;
  }

  _validateFields() {
    setState(() {
      _isAccountFieldValid =
          int.tryParse(_accountNumberFieldController.text) != null;
      _isValueFieldValid = double.tryParse(_valueFieldController.text) != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating Transfer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _accountNumberFieldController,
              label: 'Account number',
              hint: '0000',
              autofocus: true,
              onChanged: (value)  => _isAccountFieldDirty = true,
              hasError: _isAccountFieldDirty && !_isAccountFieldValid,
            ),
            Editor(
              controller: _valueFieldController,
              label: 'Value',
              hint: '0.00',
              icon: Icons.monetization_on,
              onChanged: (value)  => _isValueFieldDirty = true,
              hasError: _isValueFieldDirty && !_isValueFieldValid,
            ),
            RaisedButton(
              child: Text('Confirm'),
              onPressed: _isFormValid() ? () => _createTransfer(context) : null,
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
      final transferCreated = Transfer(value, accountNumber);
      debugPrint('$transferCreated');
      Navigator.pop(context, transferCreated);
    }
  }

  @override
  void dispose() {
    debugPrint('dispose called from TransferForm');
    _accountNumberFieldController.dispose();
    _valueFieldController.dispose();
    super.dispose();
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool autofocus;
  final bool hasError;
  final void Function(String) onChanged;

  Editor({
    @required this.controller,
    @required this.label,
    @required this.hint,
    this.icon,
    this.onChanged,
    this.autofocus = false,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: icon != null ? Icon(this.icon) : null,
          labelText: label,
          hintText: hint,
          focusedBorder: new OutlineInputBorder(
            borderSide:
                new BorderSide(color: hasError ? Colors.red : Colors.teal),
          ),
        ),
        keyboardType: TextInputType.number,
        autofocus: autofocus,
      ),
    );
  }
}

class TransfersList extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() {
    return TransfersListState();
  }
}

class TransfersListState extends State<TransfersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
          future.then((transferReceived) {
            debugPrint('arrived at then of the future');
            debugPrint('$transferReceived');
            if (transferReceived != null) {
              setState(() {
                widget._transfers.add(transferReceived);
              });
            }
          });
        },
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transfer{value: $value, accountNumber: $accountNumber}';
  }
}
