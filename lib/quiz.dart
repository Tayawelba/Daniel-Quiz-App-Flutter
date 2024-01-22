import 'package:daniel/questions.dart';
import 'package:daniel/result_screen.dart';
import 'package:daniel/start_page.dart';
import 'package:flutter/material.dart';

import 'data/questions_data.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late Widget screen;
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        screen = ResultScreen(
          chosenAnswers: selectedAnswers,
          showQuizScreen: switchScreen,
        );
        selectedAnswers = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // screen = ResultScreen();
    screen = StartPage(switchScreen);
  }

  void switchScreen() {
    setState(() {
      screen = QuestionPage(
        selectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuizApp",
      home: Scaffold(
        body: screen,
      ),
    );
  }
}
