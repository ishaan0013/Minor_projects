import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(
      XylophoneApp(),
    );

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void change(int a) {
      final player = AudioCache();
      player.play('note$a.wav');
    }

    Expanded button({Color c, int sn}) {
      return Expanded(
        child: TextButton(
          // color: c,
          onPressed: () {
            change(sn);
          },
          child: Text('CLICK ME'),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              button(c: Colors.red, sn: 1),
              button(c: Colors.yellow, sn: 2),
              button(c: Colors.blue, sn: 3),
              button(c: Colors.white, sn: 4),
              button(c: Colors.teal, sn: 5),
              button(c: Colors.deepOrangeAccent, sn: 6),
              button(c: Colors.brown, sn: 7),
            ],
          ),
        ),
      ),
    );
  }
}
