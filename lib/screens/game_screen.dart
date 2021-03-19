import 'package:brain_trainer_app/models/game.dart';
import 'package:brain_trainer_app/widgets/action_buttons.dart';
import 'package:brain_trainer_app/widgets/answers_grid.dart';
import 'package:brain_trainer_app/widgets/app_bar_items.dart';
import 'package:brain_trainer_app/widgets/game_ads.dart';
import 'package:brain_trainer_app/widgets/game_confetti.dart';
import 'package:brain_trainer_app/widgets/timer_question_score.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum FilterOptions { Addition, Random }

_showAlert(context) {
  Future.delayed(Duration.zero, () async {
    final String _gameMsg =
        Provider.of<Game>(context, listen: false).completionMsg;
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      descTextAlign: TextAlign.start,
      animationDuration: Duration(milliseconds: 400),
      overlayColor: Colors.transparent,
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.green,
      ),
      alertAlignment: Alignment.center,
    );

    Alert(
      style: alertStyle,
      context: context,
      type: AlertType.warning,
      title: "Choose the math",
      content: AppBarItems(),
    ).show();
  });
}

class GameScreen extends StatelessWidget {
  static const routeName = '/play-game';
  @override
  Widget build(BuildContext context) {
    final _game = context.watch<Game>();
    return Scaffold(
      appBar: AppBar(
        title: Text('BrainTrainer'),
        actions: [
          Row(
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
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              _showAlert(context);
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
