import 'package:flutter/material.dart';
import 'constraints.dart';

class RoundIconButton extends StatelessWidget {
  @override
  final IconData icon;
  final Function onPressed;
  RoundIconButton({@required this.icon,@required this.onPressed});
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}