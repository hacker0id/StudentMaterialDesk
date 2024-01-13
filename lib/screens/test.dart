import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smd/theme/colors.dart';
import 'package:smd/widgets/courseButton.dart';

import 'MainPage.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

bool engineering = false;

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              decoration: const BoxDecoration(
                  color: orangeClr,
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              height: device.height * 0.3,
              width: device.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    height: device.height * 0.055,
                    width: device.width * 0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Computer Science',
                          style: TextStyle(
                            fontFamily: 'fonts/Montserrat-Regular',
                            fontSize: 16,
                          ),
                        ),
                        //SizedBox(width: device.width * 0.01),
                        Icon(FontAwesome.laptop_code_solid)
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    height: device.height * 0.055,
                    width: device.width * 0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Mechanical',
                          style: TextStyle(
                            fontFamily: 'fonts/Montserrat-Regular',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: device.width * 0.02),
                        const Icon(FontAwesome.gear_solid)
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    height: device.height * 0.055,
                    width: device.width * 0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Electronics  ',
                          style: TextStyle(
                            fontFamily: 'fonts/Montserrat-Regular',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: device.width * 0.02),
                        const Icon(FontAwesome.plug_circle_bolt_solid)
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.create),
                    onPressed: () {
                      engineering = false;
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
