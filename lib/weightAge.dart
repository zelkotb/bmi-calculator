import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class weightAge extends StatelessWidget {
  weightAge({
    this.type,
    this.value,
    this.minus,
    this.add,
  });

  final String type;
  final int value;
  final Function add;
  final Function minus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
          child: Text(
            type,
            style: kNameStyle,
          ),
        ),
        Text(
          value.toString(),
          style: kNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              operation: add,
              icon: FontAwesomeIcons.plus,
            ),
            SizedBox(
              width: 30.0,
            ),
            RoundIconButton(
              operation: minus,
              icon: FontAwesomeIcons.minus,
            ),
          ],
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.operation});

  final IconData icon;
  final Function operation;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: operation,
      fillColor: kOperationButtonColor,
      constraints: BoxConstraints.tightFor(width: 60.0, height: 48.0),
      shape: CircleBorder(),
      elevation: 3.0,
      child: Icon(
        icon,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}
