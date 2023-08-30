import 'package:firebase_auth/widgets/custom_button.dart';
import 'package:firebase_auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class EmailPasswordSignUp extends StatefulWidget {
  const EmailPasswordSignUp({super.key});

  @override
  State<EmailPasswordSignUp> createState() => _EmailPasswordSignUpState();
}

class _EmailPasswordSignUpState extends State<EmailPasswordSignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextfield(
                controller: emailController, hintText: 'Enter you email'),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextfield(
                controller: passwordController, hintText: 'Enter you password'),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(text: 'Sign Up', onTap: () {}),
        ],
      ),
    );
  }
}
