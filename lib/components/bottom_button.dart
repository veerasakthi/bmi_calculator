import 'package:flutter/material.dart';
import '../constants/constants.dart';

class BottomButton extends StatelessWidget {

  final String buttonLabel;
  final Function buttonFun;

  BottomButton({this.buttonLabel,this.buttonFun});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFun,
      child: Container(
        child: Center(
          child: Text(buttonLabel,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20.0
            ),),
        ),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}