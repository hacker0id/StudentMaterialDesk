// ignore_for_file: must_be_immutable

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:smd/screens/Colleges/SSM_Screen.dart';
import 'package:smd/theme/colors.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
  // Track the current page
  late String currentPage;
  NavBar({required this.currentPage});
}

enum _SelectedTab { back, home, profile }

var _selectedTab = _SelectedTab.home;

class _NavBarState extends State<NavBar> {
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      debugPrint('Button Clicked =  ${_selectedTab}');
      debugPrint('Current Page = ${widget.currentPage}');
      // if (isHomePageActive) {
      //   setState(() {
      //     _selectedTab = _SelectedTab.values[1];
      //   });
      // }
      if (_selectedTab == _SelectedTab.home) {
        if (widget.currentPage == 'home') {
          debugPrint('Home Cliked On Home Page');
          setState(() {
            _selectedTab = _SelectedTab.home;
          });

          return;
        } else {
          debugPrint('Home Cliked');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SSM_Screen(),
            ),
          );
        }
      } else if (_selectedTab == _SelectedTab.profile) {
        _selectedTab = _SelectedTab.values[i];
        debugPrint('Profile Cliked');
        debugPrint('${_SelectedTab.values.indexOf(_selectedTab)}');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SSM_Screen(),
            ));
      } else if (widget.currentPage != 'home' &&
          _selectedTab == _SelectedTab.back) {
        debugPrint('Back Cliked');
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CrystalNavigationBar(
      //height: 30,
      currentIndex: _SelectedTab.values.indexOf(_selectedTab),
      unselectedItemColor: Colors.white70,
      backgroundColor: greenClr,
      onTap: _handleIndexChanged,
      items: [
        //* Back
        CrystalNavigationBarItem(
          icon: IconlyBold.arrow_left_2,
          unselectedIcon: IconlyLight.arrow_left_2,
          selectedColor: Colors.white,
        ),

        //* Home
        CrystalNavigationBarItem(
          icon: IconlyBold.home,
          unselectedIcon: IconlyLight.home,
          selectedColor: Colors.white,
        ),

        //* Profile
        CrystalNavigationBarItem(
          icon: IconlyBold.user_2,
          unselectedIcon: IconlyLight.user,
          selectedColor: Colors.white,
        ),
      ],
    );
  }
}
