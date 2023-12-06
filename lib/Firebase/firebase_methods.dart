// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

//^ SignUp Method Firebase

late UserCredential userCredential;
final FirebaseAuth auth = FirebaseAuth.instance;
Future<void> registerUser(String registerEmail, String registerPassword) async {
  try {
    userCredential = await auth.createUserWithEmailAndPassword(
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

//^ Login Method Firebase

Future<void> signInWithEmailAndPassword(
    String loginEmail, String loginPassword) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginEmail,
      password: loginPassword,
    );
    print("Signed in: ${userCredential.user!.uid}");
  } catch (e) {
    print("Error: $e");
  }
}
