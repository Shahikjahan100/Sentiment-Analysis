import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (error) {
      // Handle login errors, such as invalid credentials
      print('Error signing in: $error');
      // You can handle errors here or throw it to be handled elsewhere
      throw error;
    }
  }
}
