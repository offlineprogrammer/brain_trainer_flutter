import 'package:brain_trainer_app/models/answer.dart';
import 'package:flutter/material.dart';

class AnswersProvider with ChangeNotifier {
  List<Answer> _answers = [Answer(1), Answer(2), Answer(3), Answer(4)];

  List<Answer> get answers {
    return [..._answers];
  }
}
