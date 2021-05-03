import 'package:brain_trainer_app/main.dart';
import 'package:brain_trainer_app/models/game.dart';
import 'package:brain_trainer_app/widgets/app_drawrer.dart';
import 'package:brain_trainer_app/widgets/game_ads.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HighScoreScreen extends StatelessWidget {
  static const routeName = '/high-score';

  Widget _highScoreItem(
      Text itemTitle, IconData leadinngIcon, Color itemColor) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Card(
        child: ListTile(
          tileColor: itemColor,
          contentPadding: EdgeInsets.all(20.0),
          leading: Icon(
            leadinngIcon,
            size: 35,
            color: Colors.white,
          ),
          title: itemTitle,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      'High Score',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _playerhighScoreGame =
        Provider.of<Game>(context).player.highScoreGame;
    return Scaffold(
      appBar: AppBar(
        title: Text('BrainTrainer'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 32.0,
              ),
              SizedBox(
                child: _buildHeader(),
                height: 50.0,
              ),
              SizedBox(
                height: 32.0,
              ),
              _highScoreItem(
                Text(
                  'On ' +
                      DateFormat('dd/MM/yyyy')
                          .format(_playerhighScoreGame.datePlayed),
                  style: TextStyle(color: Colors.white),
                ),
                Icons.calendar_today_rounded,
                Color.fromRGBO(224, 81, 98, 1),
              ),
              _highScoreItem(
                Text(
                  _playerhighScoreGame.numberOfCorrectAnswers.toString() +
                      ' correct answers',
                  style: TextStyle(color: Colors.white),
                ),
                Icons.check_circle_outline,
                Color.fromRGBO(84, 160, 86, 1),
              ),
              _highScoreItem(
                Text(
                  _playerhighScoreGame.numberOfWrongAnswers.toString() +
                      ' wrong answers',
                  style: TextStyle(color: Colors.white),
                ),
                Icons.cancel_outlined,
                Color.fromRGBO(68, 150, 224, 1),
              ),
              _highScoreItem(
                Text(
                  'score of ' + _playerhighScoreGame.score.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                Icons.emoji_events_outlined,
                Color.fromRGBO(111, 64, 222, 1),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [GameAds()],
          )
        ]),
      ),
    );
  }
}
