import 'package:brain_trainer_app/models/authentication_provider.dart';
import 'package:brain_trainer_app/screens/login_screen.dart';
import 'package:brain_trainer_app/screens/logout_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        StreamProvider(
          create: (BuildContext context) {
            return context.read<AuthenticationProvider>().authStateChanges;
          },
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
        routes: {},
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return Scaffold(
        appBar: AppBar(
          title: Text('MyShop'),
        ),
        body: firebaseUser != null ? LogoutPage() : LoginPage());
  }
}
