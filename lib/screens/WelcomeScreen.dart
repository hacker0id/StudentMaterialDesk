// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:smd/screens/RegisterScreen.dart';
import 'package:smd/theme/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String college;
    if (borderColor[0] == orangeClr)
      college = 'SSM';
    else if (borderColor[1] == orangeClr)
      college = 'University Of Kashmir';
    else if (borderColor[2] == orangeClr)
      college = 'IUST';
    else
      college = 'Error';
    return Scaffold(
      body: Center(
        child: Text(college),
      ),
    );
  }
}
