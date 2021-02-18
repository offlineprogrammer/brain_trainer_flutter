import 'package:brain_trainer_app/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInWithAppleButton(
              style: SignInWithAppleButtonStyle.black,
              iconAlignment: IconAlignment.center,
              onPressed: () {
                context.read<AuthenticationProvider>().signInWithApple();
              },
            )
          ],
        ),
      ),
    );
  }
}
