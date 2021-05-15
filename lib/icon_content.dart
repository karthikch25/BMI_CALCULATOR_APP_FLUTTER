import 'package:flutter/material.dart';
import 'constraints.dart';

class Icon_Content extends StatelessWidget {
  @override
  final IconData icon;
  final String label;
  Icon_Content({this.icon,this.label});
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label, style: kLabelTextStyle,
        ),
      ],
    );
  }
}