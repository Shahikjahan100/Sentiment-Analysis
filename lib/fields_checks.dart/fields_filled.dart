import 'package:flutter/material.dart';

class FieldsFilled extends ChangeNotifier {
  //FOR SIGN-UP
  late String _fullName = "";
  late String _email = "";
  late String _password = "";
  late String _confirmPassword = "";

  late String textMessage = "All fields are mandatory!";
  late String passwordMatch = "Password match!";
  late String passwordNotMatch = "Password doesn't match!";
  late bool color = false;
  late bool validated = false;

  //FOR SIGN-IN

  //GETTERS FOR ALL FIELDS
  String get fullName => _fullName;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  // Setters to update the values and notify listeners
  set fullName(String value) {
    _fullName = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  set confirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  //METHOD TO CHECK WHETHER VALUES ARE EMPTY OR NOT FOR SIGN-UP

  String passwordMatched() {
    if (!(fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty)) {
      if (password == confirmPassword) {
        if (password.length >= 8) {
          RegExp specialCharacterRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
          if (specialCharacterRegex.hasMatch(password)) {
            color = true;
            validated = true;
            textMessage = "Your password is strong";
            return textMessage;
          } else {
            textMessage =
                "Password must contain atleast one special characters";

            return textMessage;
          }
        } else {
          textMessage = "Password must contain atleast 8 characters";
          return textMessage;
        }
      } else {
        textMessage = "Password doesn't match";
        return textMessage;
      }
    } else {
      textMessage = "Please complete all fields";
      return textMessage;
    }
  }

  //FOR SIGN-IN
  late String _emailIn;
  late String _passwordIn;
  late bool allFilled = false;
  late bool _hideText = false;
  late String messageIn = "All fields are mandatory!";
  //SETTERS FOR SIGN-IN
  set emailSignIn(String value) {
    _emailIn = value;
    notifyListeners();
  }

  bool get hideText => _hideText;

  set passwordSignIn(String value) {
    _passwordIn = value;
    notifyListeners();
  }

//GETTERS FOR SIGN-IN
  String get emailSignIn => _emailIn;
  String get passwordSignIn => _passwordIn;

  //METHOD TO CHECK WHETHER VALUES ARE EMPTY OR NOT FOR SIGN-IN
  String checkSignIn() {
    if (!(emailSignIn.isEmpty || passwordSignIn.isEmpty)) {
      if (passwordSignIn.length >= 8) {
        RegExp specialCharacterRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
        if (specialCharacterRegex.hasMatch(passwordSignIn)) {
          allFilled = true;
          messageIn = "You are good to!";
          return messageIn;
        } else {
          allFilled = false;
          messageIn = "Invalid Password or Email!";
          return messageIn;
        }
      } else {
        allFilled = false;
        messageIn = "Invalid Password or Email!";
        return messageIn;
      }
    } else {
      allFilled = false;

      return messageIn;
    }
  }

  void toggleText() {
    _hideText = !_hideText;
    notifyListeners();
  }
}
