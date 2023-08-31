import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_demo/utils/show_Snack_Bar.dart';
import 'package:firebase_auth_demo/utils/show_otp_dialog.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //Email sign up function
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Email login
  Future<void> emailLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Email verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Phone signIn
  Future<void> phoneSignIn(BuildContext context, String phoneNumber) async {
    TextEditingController codeController = TextEditingController();
    await _auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await _auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (e) {
          showSnackBar(context, e.message!);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          showOTPDialog(
              codeController: codeController,
              context: context,
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: codeController.text.trim());
                await _auth.signInWithCredential(credential);
                Navigator.of(context).pop();
              });
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phoneNumber);
  }
}
