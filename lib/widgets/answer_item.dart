import 'package:brain_trainer_app/models/game.dart';
import 'package:flutter/material.dart';

class AnswerItem extends StatelessWidget {
  final Answer answer;

  const AnswerItem({Key key, this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              answer.value.toString(),
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
