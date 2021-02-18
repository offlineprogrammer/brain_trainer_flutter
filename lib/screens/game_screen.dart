import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 100,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                          '30s',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 100,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Text('10+5',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 100,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Text('10/25',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}