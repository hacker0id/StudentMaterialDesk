// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smd/theme/colors.dart';
import 'package:smd/theme/style.dart';

class TextInput extends StatefulWidget {
  TextInput({
    super.key,
    required this.icon,
    required this.text,
    required this.controller,
    required this.type,
    required this.onChanged,
  });
  IconData icon;
  String text;
  TextInputType type;
  Function(String) onChanged;
  TextEditingController controller;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      keyboardType: widget.type,
      autocorrect: false,
      controller: widget.controller,
      cursorColor: Colors.white,
      //cursorHeight: 16,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        filled: true,
        fillColor: orangeClr.withOpacity(0.72),
        enabledBorder: kBorderStyle,
        focusedBorder: kBorderStyle,
        prefixIcon: Icon(widget.icon),
        prefixIconColor: Colors.white,
        hintText: widget.text,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

class TextInputObsec extends StatefulWidget {
  TextInputObsec({
    super.key,
    required this.icon,
    required this.text,
    required this.obsec,
    required this.controller,
    required this.type,
    required this.onChanged,
  });
  IconData icon;
  String text;
  bool obsec;
  TextEditingController controller;
  TextInputType type;
  Function(String) onChanged;

  @override
  State<TextInputObsec> createState() => _TextInputObsecState();
}

class _TextInputObsecState extends State<TextInputObsec> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      keyboardType: widget.type,
      autocorrect: false,
      controller: widget.controller,
      obscureText: widget.obsec,
      cursorColor: Colors.white,
      //cursorHeight: 16,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        filled: true,
        fillColor: orangeClr.withOpacity(0.75),
        enabledBorder: kBorderStyle,
        focusedBorder: kBorderStyle,
        prefixIcon: Icon(widget.icon),
        prefixIconColor: Colors.white,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              widget.obsec = !widget.obsec;
            });
          },
          icon: const Icon(FontAwesomeIcons.eye),
        ),
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
