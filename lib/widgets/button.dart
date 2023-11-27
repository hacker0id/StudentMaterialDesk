// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Button(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.width,
      required this.fontSize});
  Color color;
  VoidCallback onPressed;
  String text;
  double width;
  double fontSize;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: widget.color),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white, fontSize: widget.fontSize),
        ),
      ),
    );
  }
}
