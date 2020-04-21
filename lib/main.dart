import 'package:flutter/material.dart';
import 'package:newbytebank/database/app_database.dart';
import 'package:newbytebank/models/Contact.dart';
import 'package:newbytebank/screens/Dashboard.dart';

void main() {
  runApp(BytebankApp());
  save(Contact(1, 'Gabriel', 123456)).then((id){
    findAll().then((contacts) => 
      debugPrint(contacts.toString())
    );
  });
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
