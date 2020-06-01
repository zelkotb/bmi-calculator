import 'dart:ui';

import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmi,
    @required this.comment,
    @required this.resultComment,
  });
  final String resultComment;
  final String bmi;
  final String comment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Well Done !!',
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Pacifico',
          ),
        )),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: CalculatorCard(
              color: kCardColor,
              cardContent: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Text(
                      resultComment,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      bmi,
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                          color: Colors.lightGreenAccent,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Text(
                        comment,
                        style: TextStyle(
                          fontSize: 23,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                color: kButtonColor,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Re-Calculate",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Pacifico',
                    ),
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
