import 'package:emotion_recognition/views/Textstyle/textstyle-1.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double fontSize;
  final double height;
  final double width;
  final Color color;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.fontSize = 16.0,
    required this.color,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: Colors.blue.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: CustomStyle(
        text: text,
        size: fontSize,
        color: color,
      ),
    );
  }
}
