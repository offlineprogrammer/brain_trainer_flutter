import 'package:brain_trainer_app/widgets/timer_question_score.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HighScoreGame {
  final int score;
  final int numberOfCorrectAnswers;
  final int numberOfWrongAnswers;
  final DateTime datePlayed;

  HighScoreGame(this.score, this.numberOfCorrectAnswers,
      this.numberOfWrongAnswers, this.datePlayed);
}

//1
Player _PlayerFromJson(Map<dynamic, dynamic> json) {
  return Player(
      email: json['email'],
      uid: json['uid'],
      dateCreated: DateTime.parse(json['dateCreated']),
      gameOperation: json['gameOperation']);
}

//2
Map<String, dynamic> _PlayerToJson(Player instance) => <String, dynamic>{
      'email': instance.email,
      'uid': instance.uid,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'gameOperation': instance.gameOperation,
    };

class Player with ChangeNotifier {
  final String email;
  final String uid;
  final DateTime dateCreated;
  final String gameOperation;

  Player({this.email, this.uid, this.dateCreated, this.gameOperation});

  factory Player.fromJson(Map<dynamic, dynamic> json) => _PlayerFromJson(json);

  // 5
  Map<String, dynamic> toJson() => _PlayerToJson(this);
  @override
  String toString() => "Player<$email>";
}
