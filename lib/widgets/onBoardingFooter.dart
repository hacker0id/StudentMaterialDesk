// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/screens/LoginScreen.dart';
import 'package:smd/theme/colors.dart';

class OnBoardingFooter extends StatelessWidget {
  OnBoardingFooter(
      {super.key,
      required this.imageLocation,
      required this.text,
      required this.endOfOnboarding});
  String imageLocation;
  String text;
  bool endOfOnboarding;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: device.height * 0.01),
          Transform.scale(
            scale: 0.9,
            child: Image(
              fit: BoxFit.contain,
              height: device.height * 0.26,
              width: device.width,
              image: AssetImage(imageLocation),
            ),
          ),
          SizedBox(height: device.height * 0.01),
          Text(
            text,
            style: const TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          //SizedBox(height: device.height * 0.025),
          SizedBox(height: device.height * 0.05),
          endOfOnboarding
              ? SizedBox(
                  width: device.width * .65,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: orangeClr),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Dive In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
