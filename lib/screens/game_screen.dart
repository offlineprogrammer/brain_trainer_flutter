import 'package:brain_trainer_app/models/game.dart';
import 'package:brain_trainer_app/widgets/action_buttons.dart';
import 'package:brain_trainer_app/widgets/answers_grid.dart';
import 'package:brain_trainer_app/widgets/game_confetti.dart';
import 'package:brain_trainer_app/widgets/timer_question_score.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions { Addition, Random }

class GameScreen extends StatelessWidget {
  static const routeName = '/play-game';
  @override
  Widget build(BuildContext context) {
    final _game = context.watch<Game>();
    return Scaffold(
      appBar: AppBar(
        title: Text('BrainTrainer'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              _game.restartTheGame();
            },
            icon: Icon(Icons.settings_outlined),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    child: Center(child: Text('+')),
                    value: FilterOptions.Addition),
                PopupMenuItem(
                    child: Center(child: Text('Random')),
                    value: FilterOptions.Random),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TimerQuestionScoreRow(),
              Expanded(child: AnswersGrid()),
              ActionButtons(),
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
