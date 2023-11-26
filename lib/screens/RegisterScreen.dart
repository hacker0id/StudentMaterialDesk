import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/theme/colors.dart';
import 'package:smd/widgets/button.dart';
import 'package:smd/widgets/header.dart';
import 'package:smd/widgets/textformfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greenClr,
        body: Column(
          children: [
            const Header(),
            Expanded(
              flex: 4,
              child: Container(
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
                  child: SizedBox(
                    width: device.width,
                    child: Column(
                      children: [
                        SizedBox(height: device.height * 0.03),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              //vertical: device.height * 0.01,
                              horizontal: device.width * 0.08),
                          child: Column(
                            children: [
                              TextInput(
                                text: 'Name',
                                controller: nameController,
                                icon: FontAwesomeIcons.solidUser,
                              ),
                              SizedBox(height: device.height * 0.015),
                              TextInput(
                                text: 'Email',
                                controller: nameController,
                                icon: FontAwesomeIcons.solidEnvelope,
                              ),
                              SizedBox(height: device.height * 0.015),
                              TextInput(
                                text: 'Confirm Email',
                                controller: nameController,
                                icon: FontAwesomeIcons.envelopeCircleCheck,
                              ),
                              SizedBox(height: device.height * 0.015),
                              TextInput(
                                text: 'Phone Number',
                                controller: nameController,
                                icon: FontAwesomeIcons.phone,
                              ),
                              SizedBox(height: device.height * 0.02),
                              Container(
                                height: device.height * 0.16,
                                color: greyClr,
                                child: const Center(
                                  child: Text('College Slider Goes Here'),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: device.height * 0.02),
                        Button(
                          fontSize: 16,
                          color: greenClr,
                          text: 'Submit',
                          onPressed: () {},
                          width: device.width * 0.6,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}
