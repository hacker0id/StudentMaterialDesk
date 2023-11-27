import 'package:flutter/material.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/theme/colors.dart';

class BottomSlider extends StatelessWidget {
  final int index;
  final Color borderColor;
  final Function() onTap;

  BottomSlider(
      {Key? key,
      required this.index,
      required this.borderColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:
            device.height <= 680 ? device.height * 0.05 : device.height * 0.1,
        width: device.width * 0.4,
        decoration: BoxDecoration(
          border: Border.all(width: 5, color: borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(
          'assets/Images/register/${index}.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
