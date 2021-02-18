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
            SizedBox(
              height: 100,
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.white, spreadRadius: 3),
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    onPressed: () {},
                    child: (Text('Start')),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
