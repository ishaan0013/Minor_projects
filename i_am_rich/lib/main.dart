import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('images/harry potter.jpg'),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('HARRY POTTER')),
      ),
    ),
  ));
}
