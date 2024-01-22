import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  final void Function() switchScreen;
  const StartPage(this.switchScreen, {super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              color: const Color.fromARGB(155, 255, 255, 255),
              width: 300,
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Application pour mieux comprendre le chapitre 11 du livre de Daniel",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  switchScreen();
                },
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text(
                  "Commencer le Quiz",
                  style: TextStyle(fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
