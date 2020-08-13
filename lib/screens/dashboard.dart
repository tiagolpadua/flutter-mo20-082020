import 'package:bytebank/screens/transactions/list.dart';
import 'package:flutter/material.dart';

import 'contacts/list.dart';

// 1 - Download the jar file https://github.com/alura-cursos/bytebank-api/raw/runnable/server.jar
// 2 - Check your java version: java -version
// 3 - Run your server: java -jar server.jar
// 4 - Test on your browser: http://localhost:8080/transactions

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FutureBuilder<double>(
            initialData: 0.2,
            future: Future.delayed(Duration(microseconds: 100))
                .then((value) => 1.0),
            builder: (context, snapshot) {
              debugPrint('${snapshot.data}');
              return AnimatedOpacity(
                opacity: snapshot.data,
                curve: Curves.easeInCubic,
                duration: Duration(seconds: 2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/bytebank_logo.png'),
                ),
              );
            },
          ),

          // New code
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _FeatureItem(
                  'Transfer',
                  Icons.monetization_on,
                  onClick: () {
                    _showContactsList(context);
                  },
                ),
                _FeatureItem(
                  'Transaction Feed',
                  Icons.description,
                  onClick: () {
                    _showTransactionsList(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showContactsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactList(),
      ),
    );
  }

  // 1 - Download the addition file (chat)
  // 2 - Extract it to a new folder "transactions" inside "screens"
  // 3 - Rename the file to list.dart
  // 4 - Fix the imports
  // 5 - Extract Transaction class to its own model file (transaction.dart)
  // 6 - Add _showTransactionsList at the dashboard and fix your navigation

  _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  const _FeatureItem(this.name, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      // Some changes here
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
