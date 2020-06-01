import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  ContentCard({
    this.color,
    this.iconData,
    this.iconName,
  });
  final Color color;
  final IconData iconData;
  final String iconName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.iconData,
          color: this.color,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          this.iconName,
          style: TextStyle(
            fontSize: 20,
            color: this.color,
          ),
        ),
      ],
    );
  }
}
