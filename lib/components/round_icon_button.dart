import 'package:flutter/material.dart';
import 'package:bmi_calculator/const_values.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPress});
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      fillColor: ICON_COLOR,
      child: Icon(icon, color: Colors.white),
      constraints: BoxConstraints(minWidth: 60, minHeight: 60),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      //side: BorderSide(style: BorderStyle.none, color:  Colors.black,width: 1),
    );
  }
}