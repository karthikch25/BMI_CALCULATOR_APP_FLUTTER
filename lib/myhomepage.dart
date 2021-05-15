import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'changecard.dart';
import 'icon_content.dart';
import 'constraints.dart';
import 'results_page.dart';
import 'bottombutton.dart';
import 'roundbutton.dart';
import 'calculator_brain.dart';

enum Gender{
  male,female,
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=18;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ChangeCard(
                    onPress:(){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                      colour: selectedGender==Gender.male?kChangeCardColor:kInactiveCardColor,
                    cardChild: Icon_Content(
                      icon: FontAwesomeIcons.mars,label: 'MALE',
                    ),
                  ),
                ),
                
                Expanded(
                    child: ChangeCard(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.female;
                  });
    },
                colour: selectedGender==Gender.female?kChangeCardColor:kInactiveCardColor,
                    cardChild:Icon_Content(
                      icon: FontAwesomeIcons.venus,label: 'FEMALE',
                    ),
                    ),
                  ),
              ],
            ),
          ),
          
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ChangeCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),

                          SliderTheme(
                            data:SliderTheme.of(context).copyWith(
                              thumbColor: Color(0xFFEB1555),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF8D8E98),
                              trackHeight: 2.0,
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                              overlayShape: RoundSliderOverlayShape(overlayRadius:20.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue){
                                setState(() {
                                  height=newValue.round();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      colour: kChangeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ChangeCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed:(){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            SizedBox(
                              width: 10.0,
                            ),
                              RoundIconButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kChangeCardColor),
                ),
                
                Expanded(
                  child: ChangeCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                if(age>0 && age<100)
                                  {
                                    age--;
                                  }
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed:(){
                              setState(() {
                                if(age>=0 && age<100){
                                  age++;
                                }
                              });
                            })
                          ],
                        ),
                      ],
                    ),
                    colour: kChangeCardColor,),
                ),
              ],
            ),
          ),

          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap:(){
              CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
            Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultMessage: calc.getMessage(),
              resultText: calc.getResult(),
            ),),);
          },
          ),
        ],
      ),
    );
  }
}






