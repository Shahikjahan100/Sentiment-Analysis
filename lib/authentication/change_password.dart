import 'package:emotion_recognition/messages/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> sendPasswordResetEmail(BuildContext context, String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    showDismissableSnackBar(context, "Check Your Email to change the Password");
  } catch (error) {
    print('Failed to send password reset email: $error');
    showDismissableSnackBar(context, error.toString());
  }
}
