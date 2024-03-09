import 'package:emotion_recognition/views/Textstyle/textstyle-1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customTextWidget extends StatelessWidget {
  final FontWeight? weight;
  final CustomStyle customStyle;

  customTextWidget({
    required this.customStyle,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      customStyle.text,
      style: GoogleFonts.kanit(
        fontSize: customStyle.size,
        color: customStyle.color,
        fontWeight: weight,
      ),
    );
  }
}
