import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(Magic8BallApp());

class Magic8BallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MagicBallPage(),
      ),
    );
  }
}

class MagicBallPage extends StatefulWidget {
  @override
  _MagicBallPageState createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  int ballNumber = 1;
  int backgroundNumber = 1;

  void changeBallAndBackground() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
      backgroundNumber = Random().nextInt(3) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background$backgroundNumber.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: TextButton(
          onPressed: changeBallAndBackground,
          child: Image.asset('images/ball$ballNumber.png'),
        ),
      ),
    );
  }
}
