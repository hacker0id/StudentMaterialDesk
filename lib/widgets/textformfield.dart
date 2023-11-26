// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smd/theme/colors.dart';
import 'package:smd/theme/style.dart';

class TextInput extends StatefulWidget {
  TextInput(
      {super.key,
      required this.icon,
      required this.text,
      required this.obsec,
      required this.controller});
  IconData icon;
  String text;
  bool obsec;
  TextEditingController controller;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: widget.controller,
      obscureText: widget.obsec,
      cursorColor: Colors.white,
      cursorHeight: 16,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        filled: true,
        fillColor: orangeClr.withOpacity(0.75),
        enabledBorder: kBorderStyle,
        focusedBorder: kBorderStyle,
        prefixIcon: Icon(widget.icon),
        prefixIconColor: Colors.white,
        suffixIcon: widget.obsec
            ? IconButton(
                onPressed: () {
                  setState(() {
                    //widget.obsec = !widget.obsec;
                  });
                },
                icon: Icon(FontAwesomeIcons.eye),
              )
            : null,
        suffixIconColor: Colors.white,
        hintText: widget.text,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
