import 'package:brain_trainer_app/models/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionButtons extends StatefulWidget {
  const ActionButtons({
    Key key,
  }) : super(key: key);

  @override
  _ActionButtonsState createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  @override
  Widget build(BuildContext context) {
    final _game = Provider.of<Game>(context);
    return SizedBox(
      height: 100,
      child: GestureDetector(
        onTap: () {
          _game.playTheGame();
        },
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
                return Image.asset(
                  _game.actionButtonImage,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
