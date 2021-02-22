import 'package:brain_trainer_app/models/game.dart';
import 'package:brain_trainer_app/widgets/answer_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswersGrid extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    final gameData = Provider.of<Game>(context);
    final answers = gameData.answers;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: answers.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          return AnswerItem(
            answer: answers[index],
            index: index,
          );
        });
  }
}
