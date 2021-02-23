import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

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
      ),
    );
  }
}
