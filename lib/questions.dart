import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/questions_data.dart';
import 'models/question_model.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key, required this.selectAnswer});

  final void Function(String ans) selectAnswer;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int questionNumber = 0;

  void answerQuestion(String answer) {
    widget.selectAnswer(answer);
    setState(() {
      // print('QUSTION NUMBER ${questionNumber + 1}');
      questionNumber++;
    });
  }

  Widget getText(text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 27),
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.mPlus1(
          color: const Color.fromARGB(200, 255, 255, 255),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        /*const TextStyle(
          color: Color.fromARGB(171, 255, 255, 255),
          fontSize: 25,
        ),*/
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Question questn = questions[questionNumber];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 48, 9, 138),
            Color.fromARGB(255, 81, 6, 110),
          ],
        ),
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getText(questn.text),
              const SizedBox(
                height: 30,
              ),
              ...questn.getShuffledAnswers().map((answer) => AnsBtn(
                  text: answer,
                  onPressed: () {
                    answerQuestion(answer);
                  }))
              // AnsBtn(text: questn.answers[1], onPressed: () {}),
              // AnsBtn(text: questn.answers[0], onPressed: () {}),
              // AnsBtn(text: questn.answers[1], onPressed: () {}),
              // AnsBtn(text: questn.answers[3], onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class AnsBtn extends StatefulWidget {
  const AnsBtn({super.key, required this.text, required this.onPressed});

  final String text;

  final void Function() onPressed;

  @override
  State<AnsBtn> createState() => _AnsBtnState();
}

class _AnsBtnState extends State<AnsBtn> {
  @override
  Widget build(BuildContext context) {
    bool isClickable = true;
    return Container(
      margin: const EdgeInsets.all(2),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              fixedSize: const Size(300, 40),
              backgroundColor: const Color.fromARGB(255, 8, 14, 51),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          onPressed: isClickable
              ? () {
                  setState(() {
                    if (isClickable) {
                      widget.onPressed();
                    }
                    isClickable = false;
                    // print(isClickable ? 'CAN CLICK' : 'CANNOT CLICK');
                  });
                }
              : () {},
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          )),
    );
  }
}
