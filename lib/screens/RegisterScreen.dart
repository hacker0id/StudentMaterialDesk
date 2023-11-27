// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smd/components/Controllers.dart';
import 'package:smd/screens/MainPage.dart';
import 'package:smd/theme/colors.dart';
import 'package:smd/widgets/RegisterCarousel.dart';
import 'package:smd/widgets/button.dart';
import 'package:smd/widgets/header.dart';
import 'package:smd/widgets/textformfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

int _currentIndex = 0;
List<Color> _borderColors = List.generate(3, (index) => greenClr);

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
                    child: Column(
                      children: [
                        SizedBox(
                            height: device.height <= 680
                                ? device.height * 0.015
                                : device.height * 0.03),
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
                              device.height <= 680
                                  ? SizedBox(height: device.height * 0.01)
                                  : SizedBox(height: device.height * 0.015),
                              TextInput(
                                text: 'Email',
                                controller: nameController,
                                icon: FontAwesomeIcons.solidEnvelope,
                              ),
                              device.height <= 680
                                  ? SizedBox(height: device.height * 0.01)
                                  : SizedBox(height: device.height * 0.015),
                              TextInputObsec(
                                  icon: FontAwesomeIcons.key,
                                  text: 'Password',
                                  obsec: true,
                                  controller: registerPasswordController),
                              device.height <= 680
                                  ? SizedBox(height: device.height * 0.01)
                                  : SizedBox(height: device.height * 0.015),
                              TextInput(
                                text: 'Phone Number',
                                controller: nameController,
                                icon: FontAwesomeIcons.phone,
                              ),
                              device.height <= 680
                                  ? SizedBox(height: device.height * 0.015)
                                  : SizedBox(height: device.height * 0.02),
                              SizedBox(
                                height: device.height * 0.16,
                                // child: CarouselSlider(
                                //   items: List.generate(
                                //     3,
                                //     (index) => BottomSlider(
                                //       index: index,
                                //     ),
                                //   ),
                                //   options: CarouselOptions(
                                //     onPageChanged: (index, reason) {
                                //       setState(() {
                                //         currentIndex = index;
                                //       });
                                //     },
                                //     //initialPage: 0,
                                //     viewportFraction: 0.5,
                                //     height: device.height * 0.16,
                                //     enlargeCenterPage: true,
                                //     enlargeFactor: 0.5,
                                //     aspectRatio: 16 / 9,
                                //   ),
                                // ),
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentIndex = index;
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
                                      borderColor: _borderColors[index],
                                      onTap: () {
                                        setState(() {
                                          _borderColors = List.generate(
                                              3, (index) => greenClr);
                                          _borderColors[index] = orangeClr;
                                        });
                                      },
                                    );
                                  }),
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
                          width: device.width * 0.4,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}
