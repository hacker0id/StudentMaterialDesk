// ignore_for_file: constant_identifier_names, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/theme/colors.dart';
import 'package:smd/widgets/courseButton.dart';
import 'package:smd/widgets/courseDropDownButton.dart';
import 'package:smd/widgets/navbar.dart';

class SSM_Screen extends StatefulWidget {
  const SSM_Screen({super.key});

  @override
  State<SSM_Screen> createState() => _SSM_ScreenState();
}

class _SSM_ScreenState extends State<SSM_Screen> {
  //....
  bool engineering = false;
  bool computerApplications = false;
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
            SizedBox(height: device.height * 0.02),
            Expanded(
              flex: 2,
              child: Container(
                // height: device.height * 0.1,
                width: device.width * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: Transform.scale(
                    scale: 0.9,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      'assets/Images/register/0.png',
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
                      SizedBox(height: device.height * 0.015),
                      const Text(
                        'Courses Offered',
                        style: TextStyle(
                          fontFamily: 'fonts/Montserrat-Regular',
                          fontSize: 18,
                          wordSpacing: 2,
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
                                if (computerApplications == true) {
                                  computerApplications = false;
                                }
                                setState(() {});
                              },
                              buttonText: 'Engineering',
                              icon: engineering_rounded,
                            )
                          : CourseDropDown(
                              height: device.height * 0.4,
                              width: device.width * 0.8,
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
                            ),

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
                                if (computerApplications = true) {
                                  computerApplications = false;
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
                                  text: 'Bachelor of Business\nAdministration',
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
                              width: device.width * 0.8,
                            ),

                      SizedBox(height: device.height * 0.02),

                      //~ Management End

                      //~ Computer Applications Start

                      !computerApplications
                          ? CourseButton(
                              onTap: () {
                                computerApplications = true;
                                if (engineering == true) {
                                  engineering = !engineering;
                                }
                                if (management == true) {
                                  management = !management;
                                }
                                setState(() {});
                              },
                              buttonText: 'Computer Applications',
                              icon: Bootstrap.laptop_fill,
                            )
                          : CourseDropDown(
                              widgets: [
                                SizedBox(height: device.height * 0.015),
                                CourseDropDownButton(
                                  text: 'Master of Computer\nApplications',
                                  icon: Icons.laptop_windows_outlined,
                                ),
                                SizedBox(height: device.height * 0.015),
                                IconButton(
                                  color: Colors.white,
                                  icon: const Icon(
                                    FontAwesome.circle_xmark_solid,
                                  ),
                                  onPressed: () {
                                    // management = false;
                                    // engineering = false;
                                    computerApplications = false;
                                    setState(() {});
                                  },
                                ),
                              ],
                              height: device.height * 0.2,
                              width: device.width * 0.8,
                            ),

                      //~ Computer Applications End
                      SizedBox(height: device.height * 0.05),
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
