import 'package:firebase_auth_demo/widgets/custom_button.dart';
import 'package:firebase_auth_demo/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final phoneController = TextEditingController();
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextfield(
                controller: phoneController,
                hintText: 'Enter you phone number'),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(text: 'Send OTP', onTap: () {}),
        ],
      ),
    );
  }
}
