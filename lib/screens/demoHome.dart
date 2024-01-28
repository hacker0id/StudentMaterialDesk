import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

FirebaseAuth auth = FirebaseAuth.instance;

class _TestingPageState extends State<TestingPage> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'PHONE NUMBER',
                ),
              ),
              SizedBox(height: 50),
              MaterialButton(
                onPressed: () {
                  auth.verifyPhoneNumber(
                      phoneNumber: "+91${phoneController.text.toString()}",
                      verificationCompleted: (_) {},
                      verificationFailed: (e) {
                        Fluttertoast.showToast(msg: e.toString());
                        debugPrint('Error : $e');
                      },
                      codeSent: (String verificationID, int? token) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => VerifyOTP(
                        //               verificationID: verificationID,
                        //             )));

                        debugPrint('CODE SENT SUCCESSFULLY !!');
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Fluttertoast.showToast(msg: e.toString());
                      });
                },
                child: Text('Login'),
                color: Colors.deepOrange.shade300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
