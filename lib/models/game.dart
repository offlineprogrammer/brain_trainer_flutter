import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Answer with ChangeNotifier {
  final int value;

  Answer(this.value);
}

class Game with ChangeNotifier {
  final String operation;
  int _correctAnswerIndex;
  int a = 0;
  int b = 0;
  int _score = 0;
  int _numberOfQuestions = 0;
  bool isActive;
  Timer _timer;
  int _countdown = 30;
  String _actionButtonImage = 'assets/images/play.png';
  String _mathOperation;
  bool _gameOver = false;

  List<Answer> _answers = [Answer(1), Answer(2), Answer(3), Answer(4)];

  List<Answer> get answers {
    // return [..._answers];
    return _answers;
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

  String get question {
    print(_actionButtonImage);
    return '$a $operation $b';
  }

  bool get gameOver {
    return _gameOver;
  }

  String get score {
    return '$_score / $_numberOfQuestions';
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
          _gameOver = true;
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
      _gameOver = false;
      _numberOfQuestions = 0;
      _score = 0;
      _actionButtonImage = 'assets/images/question.png';
      setupGameRound();
      startTimer();
      isActive = true;
      notifyListeners();
    }
  }

  void setupGameRound() {
    int i11;
    int i12;
    _mathOperation = operation;
    if (operation?.toLowerCase() == "Random"?.toLowerCase()) {
      var list = ["+", "-", "*", "/"];
      Random r = new Random();
      _mathOperation = list[r.nextInt(list.length)];
    }
    Random rand = new Random();
    if (_mathOperation?.toLowerCase() == ("/")?.toLowerCase()) {
      i11 = rand.nextInt(14) + 1;
      i12 = rand.nextInt(6);
      b = i12 + 1;
      a = i11 * b;
    } else if (_mathOperation?.toLowerCase() == ("-")?.toLowerCase()) {
      i11 = rand.nextInt(21) + 1;
      i12 = rand.nextInt(21);
      int i20 = i12 + 1;
      if (i11 > i20) {
        a = i11;
        b = i20;
      } else {
        a = i20;
        b = i11;
      }
    } else {
      a = rand.nextInt(21);
      b = rand.nextInt(21);
    }
    _correctAnswerIndex = rand.nextInt(4);
    // sumTextView.setText(String.format("%s %s %s", Integer.toString(a), myGame.getOperation() , Integer.toString(b)));
    answers.clear();
    for (int i = 0; i < 4; i++) {
      if (i == _correctAnswerIndex) {
        answers.add(new Answer(doMath(a, b, _mathOperation)));
      } else {
        int wrongAnswer = getRandom(a, b, _mathOperation);
        while (wrongAnswer == doMath(a, b, _mathOperation)) {
          wrongAnswer = getRandom(a, b, _mathOperation);
        }
        answers.add(new Answer(wrongAnswer));
      }
    }

    _answers = answers;
    notifyListeners();
  }

  int getRandom(int a, int b, String sOperation) {
    int result = 41;

    Random rand = new Random();
    if (sOperation?.toLowerCase() == ("+")?.toLowerCase()) {
      result = rand.nextInt(41);
    } else if (sOperation?.toLowerCase() == ("-")?.toLowerCase()) {
      result = rand.nextInt(41 + 20) - 20;
    } else if (sOperation?.toLowerCase() == ("*")?.toLowerCase()) {
      if (a == 0) {
        a = 1;
      }
      if (b == 0) {
        b = 1;
      }
      result = rand.nextInt(2 * a * b);
    } else if (sOperation?.toLowerCase() == ("/")?.toLowerCase()) {
      result = rand.nextInt(41);
    }
    return result;
  }

  int doMath(int a, int b, String sOperation) {
    int result = 0;
    if (sOperation?.toLowerCase() == ("+")?.toLowerCase()) {
      result = a + b;
    } else if (sOperation?.toLowerCase() == ("-")?.toLowerCase()) {
      result = a - b;
    } else if (sOperation?.toLowerCase() == ("*")?.toLowerCase()) {
      result = a * b;
    } else if (sOperation?.toLowerCase() == ("/")?.toLowerCase()) {
      result = (a / b).round();
    }
    return result;
  }

  void answerSelected(Answer answer) {
    if (isActive != null && isActive) {
      _numberOfQuestions = _numberOfQuestions + 1;
      print(answer.value);
      verifyAnswer(answer);
      setupGameRound();

      notifyListeners();
    }
  }

  void verifyAnswer(Answer answer) {
    if (answer.value == _answers[_correctAnswerIndex].value) {
      _actionButtonImage = 'assets/images/correct.png';
      _score = _score + 1;
      notifyListeners();
    } else {
      _actionButtonImage = 'assets/images/wrong.png';
      notifyListeners();
    }
  }
}
