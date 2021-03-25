import 'package:brain_trainer_app/widgets/app_drawrer.dart';
import 'package:brain_trainer_app/widgets/config_grid.dart';
import 'package:brain_trainer_app/widgets/game_ads.dart';
import 'package:flutter/material.dart';

class OperationsScreen extends StatelessWidget {
  static const routeName = '/operation-config';
  @override
  Widget build(BuildContext context) {
    // final _game = context.watch<Game>();
    return Scaffold(
      appBar: AppBar(
        title: Text('BrainTrainer'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Expanded(child: ConfigGrid()), GameAds()],
          ),
        ]),
      ),
    );
  }
}
