import 'package:flutter/material.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/theme/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: greenClr,
        // height: device.height / 2.2,
        child: Padding(
          padding: EdgeInsets.only(top: device.height * 0.05),
          child: Image(
            height: device.height * 0.5,
            width: device.width,
            image: const AssetImage(
              'assets/Images/logo/2.png',
            ),
          ),
        ),
      ),
    );
  }
}
