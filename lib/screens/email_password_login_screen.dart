import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_demo/services/firebase_auth_methods.dart';
import 'package:firebase_auth_demo/widgets/custom_button.dart';
import 'package:firebase_auth_demo/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class EmailPasswordLogin extends StatefulWidget {
  const EmailPasswordLogin({super.key});

  @override
  State<EmailPasswordLogin> createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).emailLogin(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
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
          CustomButton(text: 'Login', onTap: loginUser),
        ],
      ),
    );
  }
}
