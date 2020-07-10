import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reusable_card.dart';
import '../Components/icon_text.dart';
import '../constants.dart';
import 'results_page.dart';
import '../Components/calculate_button.dart';
import '../Components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget>[
         //Male and Female Toggle Button
         Expanded(
             child: Row(
               children: <Widget>[
                 //The Male Toggle Card
                 Expanded(
                   child: ReusableCard(
                     onPress: (){
                       setState(() {
                         selectedGender = Gender.male;
                       });
                     },
                     colour: selectedGender == Gender.male ? kActiveCardColor: kInactiveCardColor,
                     cardChild: IconText(
                       icon: FontAwesomeIcons.mars,
                       label: 'MALE',
                     ),
                   ),
                 ),
                 //The Female Toggle Card
                 Expanded(
                   child: ReusableCard(
                     onPress: (){
                       setState(() {
                         selectedGender = Gender.female;
                       });
                     },
                     colour: selectedGender == Gender.female ? kActiveCardColor: kInactiveCardColor,
                     cardChild: IconText(
                       icon: FontAwesomeIcons.venus,
                       label: 'FEMALE'
                     ),
                   ),
                 ),
               ],
             )
         ),
         //Height Slider
         Expanded(
             child: Row(
               children: <Widget>[
                 Expanded(
                   child: ReusableCard(
                       colour: kActiveCardColor,
                     cardChild: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text(
                           'HEIGHT',
                           style: kLabelTextStyle,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.end,
                           textBaseline: TextBaseline.alphabetic,
                           children: <Widget>[
                             Text(
                               height.toString(),
                               style:kNumberTextStyle,
                             ),
                             Text(
                               'cm',
                               style: kLabelTextStyle,
                             ),
                           ],
                         ),
                         SliderTheme(
                           data: SliderTheme.of(context).copyWith(
                             inactiveTrackColor: Color(0xFF8D8E98),
                             activeTrackColor: Colors.white,
                             thumbColor: kBottomContainerColor,
                             overlayColor: Color(0x1fEB1555),
                             thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                             overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                           ),
                           child: Slider(
                             value: height.toDouble(),
                             min: 120.0,
                             max: 220.0,
                             onChanged: (double newValue){
                               setState(() {
                                 height = newValue.round();
                               });
                             },
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             )
         ),
         //Weight Card
         Expanded(
             child: Row(
               children: <Widget>[
                 //Weight Card
                 Expanded(
                   child: ReusableCard(
                     colour: kActiveCardColor,
                     cardChild: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
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
                           children: <Widget>[
                             RoundIconButton(
                                 icon: FontAwesomeIcons.minus,
                               onPressed: (){
                                   setState(() {
                                     weight--;
                                   });
                               },
                             ),
                             SizedBox(
                               width: 10,
                             ),
                             RoundIconButton(
                                 icon: FontAwesomeIcons.plus,
                               onPressed: (){
                                 setState(() {
                                   weight++;
                                 });
                               },
                             ),
                           ],
                         )
                       ],
                     ),
                   ),
                 ),
                 Expanded(
                   child: ReusableCard(
                     colour: kActiveCardColor,
                     cardChild: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
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
                           children: <Widget>[
                             RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               onPressed: (){
                                 setState(() {
                                   age--;
                                 });
                               },
                             ),
                             SizedBox(
                               width: 10,
                             ),
                             RoundIconButton(
                               icon: FontAwesomeIcons.plus,
                               onPressed: (){
                                 setState(() {
                                   age++;
                                 });
                               },
                             ),
                           ],
                         )
                       ],
                     ),


                   ),
                 ),
               ],
             ),
         ),
         CalculateButton(
           onTap: (){
             CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => ResultsPage(
                       bmiResult: calc.CalculateBMI(),
                       bmiText: calc.getResult(),
                       interpretation: calc.getInterpretation(),
             ),
                 ),
             );
           },
           buttonTitle: 'CALCULATE',
         )
       ],
      ),
    );
  }
}







