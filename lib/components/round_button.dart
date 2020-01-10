import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon,this.weightEdit});

  final IconData icon;
  final Function weightEdit;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: weightEdit,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints:BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
    );
  }
}
