import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/ReusableCard.dart';
import '../components/CardContent.dart';
import '../constants/constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_button.dart';
import 'package:bmi_calculator/calculate_brain.dart';

enum Gender{
male,
female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 50 ;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  cardChild: CardContent(FontAwesomeIcons.mars,'MALE'),
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },),
                ),
                Expanded(
                  child: ReusableCard(colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                  cardChild: CardContent(FontAwesomeIcons.venus,'FEMALE'),
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kReusableCardColor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,

                        children: <Widget>[
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
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 12.0
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 20.0
                          ),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                          activeColor: Colors.pink,
                          inactiveColor: Colors.grey,
                        ),
                      ),

                    ],
                  ),),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kReusableCardColor,
                  cardChild: Column(
                   children: <Widget>[
                     Text(
                       'WEIGHT',
                       style: kLabelTextStyle,
                     ),
                     SizedBox(
                       height: 1.0,
                     ),
                     Text(
                       weight.toString(),
                       style: kNumberTextStyle,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[

                         RoundIconButton(icon : FontAwesomeIcons.minus,weightEdit: (){
                           setState(() {
                             weight--;
                           });
                         },)
                         ,RoundIconButton(icon : FontAwesomeIcons.plus,weightEdit: (){
                           setState(() {
                             weight++;
                           });
                         },),
                       ],
                     )

                   ],
                  ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour: kReusableCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 1.0,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[

                            RoundIconButton(icon : FontAwesomeIcons.minus,weightEdit: (){
                              setState(() {
                                age--;
                              });
                            },)
                            ,RoundIconButton(icon : FontAwesomeIcons.plus,weightEdit: (){
                              setState(() {
                                age++;
                              });
                            },),
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(buttonLabel: 'CALCULATE',buttonFun: (){
            CalculateBrain calc = CalculateBrain(height: height,weight: weight);
          Navigator.push(context, MaterialPageRoute(builder: (context){

          return ResultPage(
            bmiResult: calc.calculateBMI(),
            interpretation: calc.getInterpretation(),
            resultText: calc.getResult(),
          );
          }));
          },
          )
        ],
      )
    );
  }
}


