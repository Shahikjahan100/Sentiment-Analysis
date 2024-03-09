import 'package:emotion_recognition/messages/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";

Future<void> signUpWithEmailAndPassword(BuildContext context, String fullName,
    String email, String password) async {
  try {
    // Create user account with email and password
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Store additional user data in Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'fullName': fullName,
      'email': email,

      // You can add more fields as needed
    });

    // User account created successfully
    showDismissableSnackBar(context, "Account created successfully!");
    print('User account created successfully');
  } catch (e) {
    showDismissableSnackBar(context, e.toString());
  }
}
