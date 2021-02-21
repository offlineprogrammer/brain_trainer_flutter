import 'dart:ffi';

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
  var _imageName = 'assets/images/play.png';
  Future<Void> _playTheGame(BuildContext context) async {
    Provider.of<Game>(context, listen: false).startTimer();
    setState(() {
      _imageName = 'assets/images/playagain.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GestureDetector(
        onTap: () {
          _playTheGame(context);
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
            child: Image.asset(
              _imageName,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
