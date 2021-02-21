import 'dart:async';

import 'package:flutter/material.dart';

class Answer {
  final int value;

  Answer(this.value);
}

class Game with ChangeNotifier {
  final String operation;
  int correctAnswerIndex;
  int a;
  int b;
  int score;
  int numberOfQuestions;
  bool isActive;
  Timer _timer;
  int _countdown = 30;

  List<Answer> _answers = [Answer(1), Answer(2), Answer(3), Answer(4)];

  List<Answer> get answers {
    return [..._answers];
  }

  Game(this.operation);

  String get timer {
    print(_countdown);
    return _countdown.toString();
  }

  void startTimer() {
    print('Star');
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    } else {
      Timer.periodic(Duration(seconds: 1), (timer) {
        if (_countdown < 1) {
          timer.cancel();
        } else {
          _countdown = _countdown - 1;
          notifyListeners();
          print(_countdown);
        }
      });

/*       _timer = new Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => () {
          if (_countdown < 1) {
            timer.cancel();
          } else {
            print('Count');
            _countdown = _countdown - 1;
          }
        },
      ); */
    }
    notifyListeners();
  }
}
