import 'package:brain_trainer_app/models/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerQuestionScoreRow extends StatefulWidget {
  const TimerQuestionScoreRow({
    Key key,
  }) : super(key: key);

  @override
  _TimerQuestionScoreRowState createState() => _TimerQuestionScoreRowState();
}

class _TimerQuestionScoreRowState extends State<TimerQuestionScoreRow> {
  @override
  Widget build(BuildContext context) {
    final _game = Provider.of<Game>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 100,
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(255, 152, 0, 1),
                  boxShadow: [
                    BoxShadow(color: Colors.white, spreadRadius: 3),
                  ],
                ),
                padding: EdgeInsets.all(10),
                /*  child: AnimatedBuilder(
                  animation: _game,
                  builder: (BuildContext context, Widget child) {
                    return Center(
                        child: Text(
                      _game.timer,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ));
                  },
                ),*/

                child: Consumer<Game>(
                  builder: (context, game, child) {
                    return Center(
                        child: Text(
                      '${game.timer}s',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ));
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(
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
                child: Consumer<Game>(
                  builder: (context, game, child) {
                    return Center(
                        child: Text(
                      '${game.question}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ));
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 100,
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(3, 169, 244, 1),
                  boxShadow: [
                    BoxShadow(color: Colors.white, spreadRadius: 3),
                  ],
                ),
                padding: EdgeInsets.all(10),
                child: Consumer<Game>(
                  builder: (context, game, child) {
                    return Center(
                        child: Text(
                      '${game.score}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ));
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
