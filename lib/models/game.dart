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

  List<Answer> _answers = [Answer(1), Answer(2), Answer(3), Answer(4)];

  List<Answer> get answers {
    return [..._answers];
  }

  Game(this.operation);
}
