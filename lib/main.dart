import 'package:bytebank/screens/transfers/list.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(ModelContainer(darkmodemodel: DarkModeModel()));

class ModelContainer extends StatelessWidget {
  final DarkModeModel darkmodemodel;

  const ModelContainer({@required this.darkmodemodel});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DarkModeModel>(
        model: darkmodemodel, child: BytebankApp());
  }
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<DarkModeModel>(
        builder: (context, child, darkmodemodel) {
      return MaterialApp(
          theme: darkmodemodel.darkmode ? ThemeData.dark() : defaultTheme(),
          home: Scaffold(
            body: TransfersList(),
          ));
    });
  }
}

class DarkModeModel extends Model {
  bool darkmode = false;

  void toggle() {
    darkmode = !darkmode;
    debugPrint('Dark mode is now $darkmode');
    notifyListeners();
  }
}

ThemeData defaultTheme() {
  return ThemeData(
    primaryColor: Colors.green[900],
    accentColor: Colors.blueAccent[700],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueAccent[700],
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
