import 'package:brain_trainer_app/models/game.dart';
import 'package:brain_trainer_app/models/player.dart';

import 'package:brain_trainer_app/providers/authentication_provider.dart';
import 'package:brain_trainer_app/screens/game_screen.dart';
import 'package:brain_trainer_app/screens/highscore_screen.dart';
import 'package:brain_trainer_app/screens/login_screen.dart';
import 'package:brain_trainer_app/screens/operations_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Game('+'),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Player(),
        ),
        StreamProvider(
          create: (BuildContext context) {
            return context.read<AuthenticationProvider>().authStateChanges;
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BrainTrainer',
        theme: ThemeData(
            primarySwatch: colorCustom,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryTextTheme:
                TextTheme(headline6: TextStyle(color: Colors.white))),
        home: MyHomePage(),
        routes: {
          GameScreen.routeName: (ctx) => GameScreen(),
          OperationsScreen.routeName: (ctx) => OperationsScreen(),
          HighScoreScreen.routeName: (ctx) => HighScoreScreen(),
        },
      ),
    );
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(43, 125, 20, .1),
  100: Color.fromRGBO(43, 125, 20, .2),
  200: Color.fromRGBO(43, 125, 20, .3),
  300: Color.fromRGBO(43, 125, 20, .4),
  400: Color.fromRGBO(43, 125, 20, .5),
  500: Color.fromRGBO(43, 125, 20, .6),
  600: Color.fromRGBO(43, 125, 20, .7),
  700: Color.fromRGBO(43, 125, 20, .8),
  800: Color.fromRGBO(43, 125, 20, .9),
  900: Color.fromRGBO(43, 125, 20, 1),
};
MaterialColor colorCustom = MaterialColor(0xFFF37D14, color);

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return Scaffold(
        appBar: AppBar(
          title: Text('BrainTrainer'),
        ),
        body: firebaseUser != null ? loadGameScreen(context) : LoginPage());
  }

  Future<Object> loadGameScreen(BuildContext context) {
    Future.delayed(Duration.zero, () {
      return Navigator.of(context).pushNamedAndRemoveUntil(
          GameScreen.routeName, (Route<dynamic> route) => false);
    });
  }
}
