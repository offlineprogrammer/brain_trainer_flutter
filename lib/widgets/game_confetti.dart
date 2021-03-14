import 'package:brain_trainer_app/models/game.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GameConfetti extends StatefulWidget {
  @override
  _GameConfettiState createState() => _GameConfettiState();
}

class _GameConfettiState extends State<GameConfetti> {
  ConfettiController _controllerCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

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
        type: AlertType.success,
        title: "Well done",
        desc: _gameMsg,
        buttons: [
          DialogButton(
            child: Text(
              "Brilliant!!!",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
          confettiController: _controllerCenter,
          blastDirectionality: BlastDirectionality
              .explosive, // don't specify a direction, blast randomly
          shouldLoop: false,
          gravity: 0.5,
          emissionFrequency: 0.05,
          numberOfParticles:
              20, // start again as soon as the animation is finished
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.pink,
            Colors.orange,
            Colors.purple
          ], // manually specify the colors to be used
          child: _showAlert(context)),
    );
  }
}
