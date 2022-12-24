import 'package:flutter/material.dart';
import 'final_const.dart';

class ReuseableColumn extends StatelessWidget {
  ReuseableColumn({this.icons, this.label});
  final IconData icons;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 80.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          label,
          style: textstyle,
        ),
      ],
    );
  }
}
