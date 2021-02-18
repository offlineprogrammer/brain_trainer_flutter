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
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(255, 152, 0, 1),
              boxShadow: [
                BoxShadow(color: Colors.white, spreadRadius: 3),
              ],
            ),
            padding: EdgeInsets.all(10),
            child: Center(
                child: Text(
              selectedAnswer.value.toString(),
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
