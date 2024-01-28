// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smd/components/helpers.dart';
import 'package:smd/screens/Colleges/IUST_Screen.dart';
import 'package:smd/screens/Colleges/SSM_Screen.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/screens/RegisterScreen.dart';
import 'package:smd/theme/colors.dart';
import 'package:smd/widgets/button.dart';

class PopUpScreen extends StatefulWidget {
  const PopUpScreen({super.key});

  @override
  State<PopUpScreen> createState() => _PopUpScreenState();
}

late String selectedCollege;

class _PopUpScreenState extends State<PopUpScreen> {
  var selectedCollegeIndex;
  bool collegeSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenClr,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: device.height * 0.12, horizontal: device.width * 0.08),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: const [
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
              color: orangeClr.withOpacity(0.8),
              borderRadius: BorderRadius.all(
                Radius.circular(26),
              )),
          width: device.width,
          height: device.height,
          child: Column(
            children: [
              const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  maxRadius: 100,
                  foregroundImage: AssetImage('assets/Images/logo/2.png')),
              // SizedBox(height: device.height * 0.01),
              Center(
                child: Text(
                  'Select Your College',
                  style: TextStyle(fontSize: 18.5),
                ),
              ),
              SizedBox(height: device.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  collegeSelector(0, () {}),
                  SizedBox(width: device.width * 0.1),
                  collegeSelector(1, () {}),
                ],
              ),
              SizedBox(height: device.height * 0.035),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  collegeSelector(2, () {}),
                  SizedBox(width: device.width * 0.1),
                  collegeSelector(3, () {}),
                ],
              ),

              SizedBox(height: device.height * 0.05),
              Opacity(
                opacity: collegeSelected ? 1 : 0.7,
                child: Button(
                  color: greenClr,
                  fontSize: 17,
                  onPressed: collegeSelected
                      ? () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            if (selectedCollegeIndex == 0) {
                              selectedCollege = 'SSM';
                              return SSM_Screen();
                            } else if (selectedCollegeIndex == 1) {
                              selectedCollege = 'UOK';
                            } else if (selectedCollegeIndex == 2) {
                              selectedCollege = 'IUST';
                              return IUST_Screen();
                            } else if (selectedCollegeIndex == 3) {
                              selectedCollege = 'IITM';
                              // return SSM_Screen();
                            } else {
                              selectedCollege = 'IITM';
                              return SSM_Screen();
                            }
                            return const SizedBox();
                          }));
                        }
                      : () {
                          SnackbarService.showSMDSnackbar(
                              context, 'Please Select College First');
                        },
                  text: 'Continue',
                  width: device.width * 0.45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget collegeSelector(int index, VoidCallback function) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCollegeIndex = index;
          collegeSelected = true;
        });
        function();
      },
      child: Container(
        height:
            device.height <= 680 ? device.height * 0.04 : device.height * 0.12,
        width: device.width * 0.25,
        decoration: BoxDecoration(
          color: selectedCollegeIndex == index ? greenClr : greyClr,
          border: Border.all(
              width: 5,
              color: selectedCollegeIndex == index ? greenClr : greyClr),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Image.asset(
            'assets/Images/register/$index.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
