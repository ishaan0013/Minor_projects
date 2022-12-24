import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: magicball(),
      ),
    );

class magicball extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ball(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Center(child: Text('ASK ME ANYTHING')),
      ),
      backgroundColor: Colors.lightBlue,
    );
  }
}

class ball extends StatefulWidget {
  @override
  _ballState createState() => _ballState();
}

class _ballState extends State<ball> {
  int balls = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () {
            setState(() {
              balls = Random().nextInt(4) + 1;
            });
          },
          child: Image.asset('images/ball$balls.png'),
        ),
      ],
    );
  }
}
