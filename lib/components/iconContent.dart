import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../const_values.dart';


class icon_content extends StatelessWidget {

  icon_content({required this.icon, this.text});

  final IconData icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
          color: ICON_COLOR,
          size: 90,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text!,
          style: BUTTON_TEXT_STYLE
        )
      ],
    );
  }
}