import 'package:brain_trainer_app/models/answer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedAnswer = Provider.of<Answer>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {},
          child: Text(selectedAnswer.value.toString()),
        ),
      ),
    );
  }
}
