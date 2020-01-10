import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CardContent extends StatelessWidget {

  final IconData iconData;
  final String textData;

  CardContent(this.iconData,this.textData);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
            iconData,
            size: 80,
//            color: Color(0xFF8D8E98)
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          textData,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}