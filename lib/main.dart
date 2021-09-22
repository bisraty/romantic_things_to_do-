import 'package:flutter/material.dart';
import 'package:romantic_things_to_do/FirstPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

       backgroundColor: Colors.black87
      ),
      home: FirstPage(),
    );
  }
}
