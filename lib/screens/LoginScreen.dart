import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smd/Firebase/firebase_methods.dart';
import 'package:smd/methods.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/screens/RegisterScreen.dart';
import 'package:smd/theme/colors.dart';
import 'package:smd/widgets/button.dart';
import 'package:smd/widgets/header.dart';
import 'package:smd/widgets/textformfield.dart';

//! FTA : only when details are entered, submit btn is enabled,
//! else not
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//..
  bool isEmailValid = false;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool enableLoginButton = false;
  Color color = Colors.black;

  //* Enable Login After Data Entered
  void enableLogin() {
    setState(() {
      enableLoginButton = loginEmailController.text.isNotEmpty &&
          loginPasswordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    device = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: greenClr,
      body: Column(
        children: [
          const Header(),
          Expanded(
            flex: device.height <= 680 ? 3 : 2,
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 2),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 2),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: SizedBox(
                width: device.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: device.height * 0.025),
                      const Text(
                        'Hello Champ 🎖',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: device.height * 0.005),
                      const Text(
                        'Glad To Have You Onboard 🎓',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: device.height * 0.03),

                      //*  Text Fields Start Here

                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: device.width * 0.08),
                          child: TextInput(
                            onChanged: (text) {
                              enableLogin();
                            },
                            type: TextInputType.name,
                            controller: loginEmailController,
                            text: 'Email',
                            icon: FontAwesomeIcons.solidEnvelope,
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: device.width * 0.08),
                          child: TextInputObsec(
                            onChanged: (text) {
                              enableLogin();
                            },
                            type: TextInputType.text,
                            controller: loginPasswordController,
                            obsec: true,
                            text: 'Password',
                            icon: FontAwesomeIcons.key,
                          )),

                      //* Text Fields End Here

                      SizedBox(height: device.height * 0.02),
                      Opacity(
                        opacity: enableLoginButton ? 1 : 0.5,
                        child: Button(
                          text: 'Login',
                          onPressed: enableLoginButton
                              ? () {
                                  isEmailValid = isValidEmail(
                                      loginEmailController.text.trim());
                                  if (isEmailValid) {
                                    try {
                                      signInWithEmailAndPassword(
                                          loginEmailController.text,
                                          loginPasswordController.text);
                                      debugPrint(
                                          '${loginEmailController.text} & ${loginPasswordController.text}');
                                    } catch (e) {
                                      setState(() {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(e.toString())));
                                      });
                                    }
                                  } else {
                                    debugPrint(
                                        '${loginEmailController.text.trim()} is not a valid email');
                                  }
                                }
                              : () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      //width: device.width * 0.7,
                                      elevation: 8,
                                      duration: const Duration(seconds: 2),
                                      dismissDirection: DismissDirection.up,
                                      shape: const RoundedRectangleBorder(
                                        // side: BorderSide(
                                        //   // width: 2,
                                        //   color: Colors.black,
                                        // ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                      ),
                                      backgroundColor:
                                          orangeClr.withOpacity(0.72),
                                      behavior: SnackBarBehavior.fixed,
                                      content: const Center(
                                        child: Text(
                                          'Enter Login Details',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                          color: greenClr,
                          width: device.width * 0.4,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: device.height * 0.02),
                      SizedBox(
                        width: device.width * 0.6,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              color = orangeClr;
                            });
                            Timer(const Duration(seconds: 1), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const RegisterScreen(),
                                ),
                              );
                            });
                          },
                          child: Center(
                            child: Text(
                              'Not Registered? SignUp',
                              style: TextStyle(color: color),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkLoginButton() {
    setState(() {
      enableLoginButton = loginEmailController.text.isNotEmpty &&
          loginPasswordController.text.isNotEmpty;
    });
  }
}
