// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/theme/colors.dart';

class CourseButton extends StatefulWidget {
  VoidCallback onTap;
  String buttonText;
  IconData icon;
  CourseButton(
      {super.key,
      required this.buttonText,
      required this.icon,
      required this.onTap});

  @override
  State<CourseButton> createState() => _CourseButtonState();
}

const IconData engineering_rounded =
    IconData(0xf70f, fontFamily: 'MaterialIcons');

class _CourseButtonState extends State<CourseButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: const BoxDecoration(
            color: orangeClr,
            borderRadius: BorderRadius.all(Radius.circular(18))),
        height: device.height * 0.07,
        width: device.width * 0.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.buttonText,
              style: const TextStyle(
                fontFamily: 'fonts/Montserrat-Regular',
                fontSize: 18,
              ),
            ),
            SizedBox(width: device.width * 0.01),
            Icon(
              widget.icon,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
