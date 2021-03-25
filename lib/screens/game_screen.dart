import 'package:brain_trainer_app/models/game.dart';
import 'package:brain_trainer_app/widgets/action_buttons.dart';
import 'package:brain_trainer_app/widgets/answers_grid.dart';
import 'package:brain_trainer_app/widgets/app_drawrer.dart';
import 'package:brain_trainer_app/widgets/game_ads.dart';
import 'package:brain_trainer_app/widgets/game_confetti.dart';
import 'package:brain_trainer_app/widgets/timer_question_score.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/play-game';
  @override
  Widget build(BuildContext context) {
    final _game = context.watch<Game>();
    return Scaffold(
      appBar: AppBar(
        title: Text('BrainTrainer'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.grade_outlined,
                  color: Colors.white,
                ),
                Text(
                  _game.highScore,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TimerQuestionScoreRow(),
              Expanded(child: AnswersGrid()),
              ActionButtons(),
              GameAds()
            ],
          ),
          (_game.gameOver != null && _game.gameOver)
              ? GameConfetti()
              : Container(),
        ]),
      ),
    );
  }
}
