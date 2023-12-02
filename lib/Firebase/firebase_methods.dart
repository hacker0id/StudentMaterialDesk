// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
Future<void> registerUser(String registerEmail, String registerPassword) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: registerEmail,
      password: registerPassword,
    );
    //* User registration successful
    print("User registered: ${userCredential.user!.email}");
  } catch (e) {
    //* Handle registration errors
    print("Error during registration: $e");
  }
}
