import 'package:flutter/material.dart';

import 'contacts/list.dart';

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
          Padding(
            padding: const EdgeInsets.all(8.0),

            // Some changes here
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactList(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  height: 100,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.people, color: Colors.white),
                      Text('Contacts', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
