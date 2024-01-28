// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/theme/colors.dart';

class CourseDropDown extends StatelessWidget {
  List<Widget> widgets;
  double? height;
  double? width;
  CourseDropDown(
      {super.key,
      required this.widgets,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: orangeClr,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      height: height, //device.height * 0.4,
      width: width, //device.width * 0.7,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, children: widgets),
      ),
    );
  }
}

class CourseDropDownButton extends StatelessWidget {
  String text;
  IconData icon;
  CourseDropDownButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      height: device.height * 0.055,
      width: device.width * 0.65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: device.width * 0.05),
            Icon(icon),
            SizedBox(width: device.width * 0.05),
            Text(
              textAlign: TextAlign.center,
              text,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'fonts/Montserrat-Regular',
              ),
            )
          ],
        ),
      ),
    );
  }
}
