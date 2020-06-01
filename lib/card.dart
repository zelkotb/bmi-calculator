import 'package:flutter/material.dart';

class CalculatorCard extends StatelessWidget {
  CalculatorCard({
    this.color,
    this.cardContent,
    this.onTap,
  });
  final Color color;
  final Widget cardContent;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap ,
      child: Container(
          child: this.cardContent,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: this.color,
          ),
        ),
    );
  }
}
