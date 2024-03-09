import 'package:emotion_recognition/views/pages/signin.dart';
import 'package:flutter/material.dart';

void showDismissableSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          // Navigate to the destination page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignIn()),
          );
        },
      ),
    ),
  );
}
