import 'package:calculator/page/base.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        textTheme: TextTheme(title: TextStyle(color: Colors.orangeAccent))
      ),
      home: SimpleCalculator(),
    );
  }
}