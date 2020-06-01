import 'package:bmi_calculator/ResultPage.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/cardContent.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/weightAge.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  var height = 170.0;
  int weightValue = 80;
  int ageValue = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Are You Fat?',
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CalculatorCard(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kCardColor,
                      cardContent: ContentCard(
                        color: selectedGender == Gender.female
                            ? kActiveCardContentColor
                            : kCardContentColor,
                        iconData: FontAwesomeIcons.female,
                        iconName: 'FEMALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: CalculatorCard(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kCardColor,
                      cardContent: ContentCard(
                        color: selectedGender == Gender.male
                            ? kActiveCardContentColor
                            : kCardContentColor,
                        iconData: FontAwesomeIcons.male,
                        iconName: 'MALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CalculatorCard(
                color: kCardColor,
                cardContent: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        'HEIGHT',
                        style: kNameStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          height.toInt().toString(),
                          style: kNumberStyle,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 18, left: 5),
                          child: Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kSliderColor,
                          inactiveTrackColor: kInactiveSliderColor,
                          thumbColor: kSliderThumbColor,
                          overlayColor: Color(0x40FFFFFF),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 22,
                          )),
                      child: Slider(
                        value: height,
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CalculatorCard(
                      color: kCardColor,
                      cardContent: weightAge(
                        add: () {
                          setState(() {
                            ++weightValue;
                          });
                        },
                        minus: () {
                          setState(() {
                            --weightValue;
                          });
                        },
                        type: 'WEIGHT',
                        value: weightValue,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CalculatorCard(
                      color: kCardColor,
                      cardContent: weightAge(
                        add: () {
                          setState(() {
                            ++ageValue;
                          });
                        },
                        minus: () {
                          setState(() {
                            --ageValue;
                          });
                        },
                        type: 'AGE',
                        value: ageValue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain brain = CalculatorBrain(
                  height: height.round(),
                  weight: weightValue,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: brain.calculateBMI(),
                      resultComment: brain.getResultComment(),
                      comment: brain.getComment(),
                    ),
                  ),
                );
              },
              child: Container(
                color: kButtonColor,
                margin: EdgeInsets.only(top: 10.0),
                height: 80.0,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
