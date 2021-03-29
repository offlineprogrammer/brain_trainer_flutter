import 'package:brain_trainer_app/models/game.dart';
import 'package:brain_trainer_app/widgets/app_drawrer.dart';
import 'package:brain_trainer_app/widgets/game_ads.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HighScoreScreen extends StatelessWidget {
  static const routeName = '/high-score';

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                leading: Icon(Icons.calendar_today_rounded),
                title: Text(DateFormat('dd/MM/yyyy')
                    .format(_playerhighScoreGame.datePlayed)),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HighScoreScreen.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text(
                    _playerhighScoreGame.numberOfCorrectAnswers.toString()),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HighScoreScreen.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.wrong_location_rounded),
                title:
                    Text(_playerhighScoreGame.numberOfWrongAnswers.toString()),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HighScoreScreen.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.star_border_outlined),
                title: Text(_playerhighScoreGame.score.toString()),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HighScoreScreen.routeName);
                },
              ),
              GameAds()
            ],
          ),
        ]),
      ),
    );
  }
}
