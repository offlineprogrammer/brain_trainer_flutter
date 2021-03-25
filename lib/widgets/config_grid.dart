import 'package:brain_trainer_app/models/operation.dart';
import 'package:brain_trainer_app/widgets/config_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ConfigGrid extends StatefulWidget {
  @override
  _ConfigGridState createState() => _ConfigGridState();
}

class _ConfigGridState extends State<ConfigGrid> {
  final List<String> myList = ['+', 'x', '/', '-', '?'];

  List<Operation> _operations = [
    Operation('+', 'Addition'),
    Operation('-', 'Substraction'),
    Operation('x', 'Multiplication'),
    Operation('÷', 'Division'),
    Operation('?', 'Random')
  ];

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: _operations.length,
      itemBuilder: (BuildContext context, int index) {
        return ConfigItem(
          operation: _operations[index],
          index: index,
        );
      },
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(index == _operations.length - 1 ? 2 : 1, 1),
    );

/*     GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: _operations.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          return ConfigItem(
            operation: _operations[index],
            index: index,
          );
        }); */
  }
}
