// ignore_for_file: constant_identifier_names, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/theme/colors.dart';
import 'package:smd/widgets/courseButton.dart';
import 'package:smd/widgets/courseDropDownButton.dart';

class IUST_Screen extends StatefulWidget {
  const IUST_Screen({super.key});

  @override
  State<IUST_Screen> createState() => _IUST_ScreenState();
}

class _IUST_ScreenState extends State<IUST_Screen> {
  //....
  bool engineering = false;
  bool management = false;
  IconData engineering_rounded =
      const IconData(0xf70f, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenClr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Expanded(
              flex: 2,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: Transform.scale(
                    scale: 0.8,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      'assets/Images/register/2.png',
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: device.width,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: device.height * 0.03),
                      const Text(
                        'Courses Offered',
                        style: TextStyle(
                          fontFamily: 'fonts/Montserrat-Regular',
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: device.height * 0.03),

                      // ~ Engineering Button + DropDown Start

                      !engineering
                          ? CourseButton(
                              onTap: () {
                                engineering = true;
                                if (management == true) {
                                  management = !management;
                                }
                                setState(() {});
                              },
                              buttonText: 'Engineering',
                              icon: engineering_rounded,
                            )
                          : CourseDropDown(
                              widgets: [
                                  SizedBox(height: device.height * 0.01),
                                  CourseDropDownButton(
                                    text: 'Computer Science',
                                    icon: FontAwesome.computer_solid,
                                  ),
                                  SizedBox(height: device.height * 0.02),
                                  CourseDropDownButton(
                                    text: 'Electronics',
                                    icon: FontAwesome.plug_circle_bolt_solid,
                                  ),
                                  SizedBox(height: device.height * 0.02),
                                  CourseDropDownButton(
                                    text: 'Electronics & Comm.',
                                    icon: FontAwesome.satellite_solid,
                                  ),
                                  SizedBox(height: device.height * 0.02),
                                  CourseDropDownButton(
                                    text: 'Mechanical',
                                    icon: FontAwesome.gears_solid,
                                  ),
                                  SizedBox(height: device.height * 0.025),
                                  IconButton(
                                    color: Colors.white,
                                    icon: const Icon(
                                      FontAwesome.circle_xmark_solid,
                                    ),
                                    onPressed: () {
                                      engineering = false;
                                      setState(() {});
                                    },
                                  ),
                                ],
                              height: device.height * 0.4,
                              width: device.width * 0.7),

                      //~ Engineering END !

                      SizedBox(height: device.height * 0.02),

                      //~ Management Start

                      !management
                          ? CourseButton(
                              onTap: () {
                                management = true;
                                if (engineering == true) {
                                  engineering = !engineering;
                                }
                                setState(() {});
                              },
                              buttonText: 'Management Studies',
                              icon: Icons.business_center_rounded,
                            )
                          : CourseDropDown(
                              widgets: [
                                  SizedBox(height: device.height * 0.03),
                                  CourseDropDownButton(
                                    text:
                                        'Bachelor of Business\nAdministration',
                                    icon: Bootstrap.briefcase,
                                  ),
                                  SizedBox(height: device.height * 0.025),
                                  CourseDropDownButton(
                                    text: 'Master of Business\nAdministration',
                                    icon: Bootstrap.briefcase_fill,
                                  ),
                                  SizedBox(height: device.height * 0.015),
                                  IconButton(
                                    color: Colors.white,
                                    icon: const Icon(
                                      FontAwesome.circle_xmark_solid,
                                    ),
                                    onPressed: () {
                                      management = false;
                                      setState(() {});
                                    },
                                  ),
                                ],
                              height: device.height * 0.25,
                              width: device.width * 0.7),

                      SizedBox(height: device.height * 0.02),
                      CourseButton(
                        onTap: () {},
                        buttonText: 'Food Technology',
                        icon: Icons.restaurant,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
