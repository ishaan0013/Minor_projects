import 'package:flutter/material.dart';
import 'input_page.dart';
import 'outputpage.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0C1134),
        scaffoldBackgroundColor: Color(0xFF0C1134),
      ),
      routes: {
        '/first': (context) => InputPage(),
        '/second': (context) => Outputpage(),
      },
      initialRoute: '/first',
    );
  }
}
