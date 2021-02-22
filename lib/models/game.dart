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
  String _actionButtonImage = 'assets/images/play.png';

  List<Answer> _answers = [Answer(1), Answer(2), Answer(3), Answer(4)];

  List<Answer> get answers {
    return [..._answers];
  }

  Game(this.operation);

  String get timer {
    print(_countdown);
    return _countdown.toString();
  }

  String get actionButtonImage {
    print(_actionButtonImage);
    return _actionButtonImage;
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
          _actionButtonImage = 'assets/images/playagain.png';
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
      _actionButtonImage = 'assets/images/question.png';
      startTimer();
      isActive = true;
      notifyListeners();
    }
  }
}
