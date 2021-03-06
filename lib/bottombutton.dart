import 'package:flutter/material.dart';
import 'constraints.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;
  @override
  BottomButton({this.onTap,this.buttonTitle});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttonTitle,
            style: kLargeButtonTextStyle,),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}