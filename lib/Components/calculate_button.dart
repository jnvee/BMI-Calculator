import 'package:flutter/material.dart';
import '../constants.dart';

class CalculateButton extends StatelessWidget {

  CalculateButton({this.onTap, this.buttonTitle});
  final Function onTap;
  final String buttonTitle;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Center(
            child: Text(
              buttonTitle,
              style: kCalculateButton,
            ),
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20 ),
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}