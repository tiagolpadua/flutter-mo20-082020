import 'package:bytebank/screens/transfers/list.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: bytebankTheme(),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key key,
  }) : super(key: key);

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
            future: Future.delayed(Duration(microseconds: 100)).then((value) => 1),
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
            }
          ),
          FutureBuilder<double>(
            initialData: 0.7,
            future: Future.delayed(Duration(microseconds: 100)).then((value) => 1),
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  padding: EdgeInsets.all(8.0),
                  height: 100 * snapshot.data,
                  width: 150 * snapshot.data,
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
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
              );
            }
          ),
        ],
      ),
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
