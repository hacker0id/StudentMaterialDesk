// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:smd/screens/MainPage.dart';
// import 'package:smd/screens/RegisterScreen.dart';
// import 'package:smd/widgets/RegisterCarousel.dart';

// class CollegeSlider extends StatefulWidget {
//   const CollegeSlider({super.key});

//   @override
//   State<CollegeSlider> createState() => _CollegeSliderState();
// }

// class _CollegeSliderState extends State<CollegeSlider> {
//   @override
//   Widget build(BuildContext context) {
//     return    //* Carousel Slider Start

//                                 SizedBox(
//                                   height: device.height * 0.16,
//                                   child: CarouselSlider(
//                                     options: CarouselOptions(
//                                       onPageChanged: (index, reason) {
//                                         setState(() {
//                                           currentIndex = index;
//                                         });
//                                       },
//                                       viewportFraction: 0.5,
//                                       height: device.height * 0.16,
//                                       enlargeCenterPage: true,
//                                       enlargeFactor: 0.5,
//                                       aspectRatio: 16 / 9,
//                                     ),
//                                     items: List.generate(3, (index) {
//                                       return BottomSlider(
//                                         index: index,
//                                         borderColor: borderColor[index],
//                                         onTap: () {
//                                           setState(() {
//                                             _enableSubmit = true;
//                                             borderColor = List.generate(
//                                                 3, (index) => greenClr);
//                                             borderColor[index] = orangeClr;
//                                           });
//                                         },
//                                       );
//                                     }),
//                                   ),
//                                 ),

//                                 //* Carousel Slider End;
//   }
// }

// class _enableSubmit {
// }