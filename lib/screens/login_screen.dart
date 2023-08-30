import 'package:firebase_auth_demo/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                text: 'Email/Password Sign Up',
                onTap: () {
                  Navigator.pushNamed(context, 'emailPasswordSignUp');
                }),
            CustomButton(
                text: 'Email/Password Login',
                onTap: () {
                  Navigator.of(context).pushNamed('emailPasswordLogin');
                }),
            CustomButton(
                text: 'Phone Sign In',
                onTap: () {
                  Navigator.pushNamed(context, 'phoneScreen');
                }),
            CustomButton(text: 'Google Sign In', onTap: () {}),
            CustomButton(text: 'Facebook Sign In', onTap: () {}),
            CustomButton(text: 'Anonymous Sign In', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
