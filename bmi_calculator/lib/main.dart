import 'package:flutter/material.dart';
import 'FormBMI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff442233),
        scaffoldBackgroundColor: Color(0xff884466),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xff888888),
          ),
        ),
      ),
      home: Info(),
    );
  }
}
