import 'package:brain_trainer_app/providers/answers_provider.dart';
import 'package:brain_trainer_app/widgets/answer_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswersGrid extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    final answers = Provider.of<AnswersProvider>(context).answers;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: answers.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: answers[index],
          child: AnswerItem(),
        );
      },
    );
  }
}
