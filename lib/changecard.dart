import 'package:flutter/material.dart';

class ChangeCard extends StatelessWidget {
  @override
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  ChangeCard({this.colour,this.cardChild,this.onPress});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(12.0),
      ),
    );
  }
}
