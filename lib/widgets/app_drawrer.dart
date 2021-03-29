import 'package:brain_trainer_app/screens/highscore_screen.dart';
import 'package:brain_trainer_app/screens/operations_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Brain Trainer'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('The Game'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.games_rounded),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OperationsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.bar_chart_outlined),
            title: Text('My High Score'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(HighScoreScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
