import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStyle extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  CustomStyle({required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ubuntu(
        color: color,
        fontSize: size,
      ),
    );
  }
}
