import 'package:aerovania_app/Pages/side%20navigation%20bar/welcome_screen.dart';
// import 'package:aerovania_app/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Pages/home_page.dart';

class AuthGate extends StatelessWidget {
  // const AuthGate({super.key});
  const AuthGate({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const WelcomeScreen();
            }
          }),
    );
  }
}
