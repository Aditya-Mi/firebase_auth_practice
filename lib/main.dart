import 'package:firebase_auth/screens/email_password_login_screen.dart';
import 'package:firebase_auth/screens/email_passwrod_signup.dart';
import 'package:firebase_auth/screens/login_screen.dart';
import 'package:firebase_auth/screens/phone_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        'emailPasswordLogin': (context) => const EmailPasswordLogin(),
        'emailPasswordSignUp': (context) => const EmailPasswordSignUp(),
        'phoneScreen': (context) => const PhoneScreen(),
      },
    );
  }
}
