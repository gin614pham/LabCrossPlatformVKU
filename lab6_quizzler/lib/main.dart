import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:lab6_quizzler/question.dart';
import 'package:lab6_quizzler/quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24.0, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () => checkAnswer(true),
            child: const Text(
              'Correct',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => checkAnswer(false),
            child: const Text(
              'Wrong',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
        Row(children: scoreKeeper),
        const SizedBox(height: 20),
      ],
    );
  }
}
