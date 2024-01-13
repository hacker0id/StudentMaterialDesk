import 'package:flutter/material.dart';
import 'package:smd/theme/colors.dart';
import 'package:smd/widgets/header.dart';
import 'package:smd/widgets/onBoardingFooter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

late Size device;
final pageController = PageController();

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    device = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: greenClr,
      body: Column(
        children: [
          //*  Header Container
          Header(
            image: 'assets/Images/logo/2.png',
          ),

          //* Lower Container

          Expanded(
            flex: 2,
            child: Container(
              //height: device.height,
              padding: EdgeInsets.symmetric(horizontal: device.width * 0.03),
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
              child: Column(children: [
                SizedBox(height: device.height * 0.01),

                //* Indicator
                SmoothPageIndicator(
                  controller: pageController,
                  count: 5,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 13,
                    dotWidth: 13,
                    activeDotColor: greenClr,
                    dotColor: Colors.grey,
                  ),
                ),
                //SizedBox(height: device.height * 0.01),
                SizedBox(height: device.height * 0.015),
                //* PageView Containers

                Expanded(
                  child: SizedBox(
                    height: (device.height / 2) - 50,
                    child: PageView(
                      controller: pageController,
                      children: [
                        OnBoardingFooter(
                          endOfOnboarding: false,
                          imageLocation: 'assets/Images/onBoarding/1.png',
                          text:
                              '📚 Discover Relevant Notes: Access a vast library of curated notes tailored to your courses. Download and study anytime, anywhere!',
                        ),
                        OnBoardingFooter(
                            endOfOnboarding: false,
                            imageLocation: 'assets/Images/onBoarding/4.png',
                            text:
                                '🎥 Watch Educational Videos: Enhance your understanding with video lectures covering key topics. Visualize concepts to ace your exams!'),
                        OnBoardingFooter(
                            endOfOnboarding: false,
                            imageLocation: 'assets/Images/onBoarding/6.png',
                            text:
                                '📝 Download Exam Papers: Prepare thoroughly with a collection of past exam papers. Practice makes perfect—get ready for success!'),
                        OnBoardingFooter(
                            endOfOnboarding: false,
                            imageLocation: 'assets/Images/onBoarding/5.png',
                            text:
                                '🌟 Why SMD?\nTailored for students, by students !\nSeamless, user-friendly design.\nRegular updates.'),
                        OnBoardingFooter(
                            endOfOnboarding: true,
                            imageLocation: 'assets/Images/onBoarding/2.png',
                            text:
                                '📱 Ready to Dive In? Let’s Ace Those Exams!'),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
