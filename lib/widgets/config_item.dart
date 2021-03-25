import 'package:brain_trainer_app/models/game.dart';
import 'package:brain_trainer_app/models/operation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigItem extends StatelessWidget {
  final int index;
  final Operation operation;

  static const _answercolot = [
    Color.fromRGBO(224, 81, 98, 1),
    Color.fromRGBO(84, 160, 86, 1),
    Color.fromRGBO(68, 150, 224, 1),
    Color.fromRGBO(111, 64, 222, 1),
    Color.fromRGBO(250, 87, 35, 1),
  ];

  const ConfigItem({Key key, this.index, this.operation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _game = Provider.of<Game>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            _game.restartTheGame(this.operation.symbol);
            Navigator.of(context).pushReplacementNamed('/');
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
              operation.symbol,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
