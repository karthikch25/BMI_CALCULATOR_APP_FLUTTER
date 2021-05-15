import 'package:bmi_calculator/changecard.dart';
import 'package:bmi_calculator/constraints.dart';
import 'package:flutter/material.dart';
import 'constraints.dart';
import 'bottombutton.dart';
import 'calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  @override
  final String bmiResult;
  final String resultText;
  final String resultMessage;

  ResultsPage({this.bmiResult,this.resultText,this.resultMessage});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
              style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ChangeCard(
            colour: kChangeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    resultMessage,style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
          ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',onTap: (){
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}
