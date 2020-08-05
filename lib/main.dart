import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: TransferForm(),
    ));
  }
}

class TransferForm extends StatelessWidget {

  final TextEditingController _accountNumberFieldController = TextEditingController();
  final TextEditingController _valueFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating Transfer'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _accountNumberFieldController,
                  style: TextStyle(fontSize: 24.0),

                  // Aditional feature one: the account number field must be selected when the form is shown
                  autofocus: true,

                  decoration: InputDecoration(
                    labelText: 'Account number',
                    hintText: '0000',
                  ),
                  onChanged: (value){
                    print(value);
                  },
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _valueFieldController,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Value',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Confirm'),
            onPressed: () {
              final int accountNumber = int.tryParse(_accountNumberFieldController.text);
              final double value = double.tryParse(_valueFieldController.text);

              if(accountNumber != null && value != null) {
                final transferCreated = Transfer(value, accountNumber);
                debugPrint('$transferCreated');
              } else {
                // Aditional feature two: we must show a message informing the input validation problem (snackbar)
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Invalid Values..."),
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}

class TransfersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TransferItem(Transfer(100.0, 1000)),
          TransferItem(Transfer(200.0, 8000)),
          TransferItem(Transfer(300.0, 7000)),
        ],
      ),
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
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
