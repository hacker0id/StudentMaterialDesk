// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smd/components/Controllers.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/screens/WelcomeScreen.dart';
import 'package:smd/theme/colors.dart';
import 'package:smd/widgets/RegisterCarousel.dart';
import 'package:smd/widgets/button.dart';
import 'package:smd/widgets/header.dart';
import 'package:smd/widgets/textformfield.dart';

int currentIndex = 0;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

List<Color> borderColor = List.generate(3, (index) => greenClr);
bool _enableSubmit = false;

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
                flex: device.height <= 680 ? 5 : 4,
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              height: device.height <= 680
                                  ? device.height * 0.015
                                  : device.height * 0.03),

                          //* Input Fields Start

                          Padding(
                            padding: EdgeInsets.symmetric(
                                //vertical: device.height * 0.01,
                                horizontal: device.width * 0.08),
                            child: Column(
                              children: [
                                TextInput(
                                  type: TextInputType.name,
                                  text: 'Name',
                                  controller: registerNameController,
                                  icon: FontAwesomeIcons.solidUser,
                                ),
                                device.height <= 680
                                    ? SizedBox(height: device.height * 0.01)
                                    : SizedBox(height: device.height * 0.015),
                                TextInput(
                                  type: TextInputType.emailAddress,
                                  text: 'Email',
                                  controller: registerEmailController,
                                  icon: FontAwesomeIcons.solidEnvelope,
                                ),
                                device.height <= 680
                                    ? SizedBox(height: device.height * 0.01)
                                    : SizedBox(height: device.height * 0.015),
                                TextInputObsec(
                                    type: TextInputType.name,
                                    icon: FontAwesomeIcons.key,
                                    text: 'Password',
                                    obsec: true,
                                    controller: registerPasswordController),
                                device.height <= 680
                                    ? SizedBox(height: device.height * 0.01)
                                    : SizedBox(height: device.height * 0.015),
                                TextInput(
                                  type: TextInputType.phone,
                                  text: 'Phone Number',
                                  controller: registerPhNumberController,
                                  icon: FontAwesomeIcons.phone,
                                ),
                                device.height <= 680
                                    ? SizedBox(height: device.height * 0.015)
                                    : SizedBox(height: device.height * 0.02),

                                //* Input Fields End

                                //* Carousel Slider Start

                                SizedBox(
                                  height: device.height * 0.16,
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentIndex = index;
                                        });
                                      },
                                      viewportFraction: 0.5,
                                      height: device.height * 0.16,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.5,
                                      aspectRatio: 16 / 9,
                                    ),
                                    items: List.generate(3, (index) {
                                      return BottomSlider(
                                        index: index,
                                        borderColor: borderColor[index],
                                        onTap: () {
                                          setState(() {
                                            _enableSubmit = true;
                                            borderColor = List.generate(
                                                3, (index) => greenClr);
                                            borderColor[index] = orangeClr;
                                          });
                                        },
                                      );
                                    }),
                                  ),
                                ),

                                //* Carousel Slider End
                              ],
                            ),
                          ),
                          SizedBox(height: device.height * 0.02),

                          Opacity(
                            opacity: _enableSubmit ? 1 : 0.5,
                            child: Button(
                              fontSize: 16,
                              color: greenClr,
                              text: 'Submit',
                              onPressed: _enableSubmit

                                  //^ College Selected? Navigate To WelcomeScreen
                                  ? () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const WelcomeScreen()));
                                    }
                                  :

                                  //^ Show Snackbar

                                  () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          //width: device.width * 0.7,
                                          elevation: 8,
                                          duration: const Duration(seconds: 2),
                                          dismissDirection: DismissDirection.up,
                                          shape: const RoundedRectangleBorder(
                                            // side: BorderSide(
                                            //   // width: 2,
                                            //   color: Colors.black,
                                            // ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            ),
                                          ),
                                          backgroundColor:
                                              orangeClr.withOpacity(0.72),
                                          behavior: SnackBarBehavior.fixed,
                                          content: const Center(
                                            child: Text(
                                              'Choose College First',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                              width: device.width * 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ));
  }
}
