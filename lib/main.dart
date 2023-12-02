import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smd/firebase_options.dart';

import 'package:smd/screens/MainPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: MainPage(),
    debugShowCheckedModeBanner: false,
  ));
}
