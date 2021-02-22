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
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    } else {
      Timer.periodic(Duration(seconds: 1), (timer) {
        if (_countdown < 1) {
          print('Timer is done');
          isActive = false;
          timer.cancel();
          notifyListeners();
        } else {
          _countdown = _countdown - 1;
          notifyListeners();
          print(_countdown);
        }
      });
    }
  }

  void playTheGame() {
    if (isActive == null || !isActive) {
      print('Start Timer');
      _countdown = 30;
      startTimer();
      isActive = true;
      notifyListeners();
    }
  }
}
