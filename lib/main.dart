import 'package:flutter/material.dart';
import 'InputPage.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF006384),
        scaffoldBackgroundColor: Color(0xFF006384),
      ),
      home: InputPage(),
    );
  }
}

