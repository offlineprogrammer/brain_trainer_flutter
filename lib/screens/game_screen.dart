import 'package:brain_trainer_app/widgets/action_buttons.dart';
import 'package:brain_trainer_app/widgets/answers_grid.dart';
import 'package:brain_trainer_app/widgets/timer_question_score.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TimerQuestionScoreRow(),
            Expanded(child: AnswersGrid()),
            ActionButtons(),
          ],
        ),
      ),
    );
  }
}
