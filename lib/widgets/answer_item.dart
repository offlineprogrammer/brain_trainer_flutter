import 'package:brain_trainer_app/models/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswerItem extends StatelessWidget {
  final Answer answer;
  final int index;

  static const _answercolot = [
    Color.fromRGBO(224, 81, 98, 1),
    Color.fromRGBO(84, 160, 86, 1),
    Color.fromRGBO(68, 150, 224, 1),
    Color.fromRGBO(111, 64, 222, 1),
  ];

  const AnswerItem({Key key, this.answer, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _game = Provider.of<Game>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            _game.answerSelected(this.answer);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _answercolot[this.index],
              boxShadow: [
                BoxShadow(color: Colors.white, spreadRadius: 3),
              ],
            ),
            padding: EdgeInsets.all(10),
            child: Center(
                child: Text(
              answer.value.toString(),
              style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
