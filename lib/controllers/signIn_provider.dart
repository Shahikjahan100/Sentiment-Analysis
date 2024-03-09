import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderSignIn extends ChangeNotifier {
  User? user;
  User? getUser() {
    return user;
  }

  setUser(User? newUser) {
    user = newUser;
    notifyListeners();
  }
}
