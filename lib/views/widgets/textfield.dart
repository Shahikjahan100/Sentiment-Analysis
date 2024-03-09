import 'package:emotion_recognition/fields_checks.dart/fields_filled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class customTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool;

  customTextField({
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.bool,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: bool,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  PasswordTextField({
    required this.hintText,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FieldsFilled(),
      child: Builder(
        builder: (context) {
          return Container(
            child: Consumer<FieldsFilled>(
              builder: (context, provider_1, child) {
                return TextField(
                  controller: controller,
                  obscureText: !provider_1.hideText,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    hintText: hintText,
                    suffixIcon: IconButton(
                      onPressed: () {
                        provider_1.toggleText();
                      },
                      icon: Icon(
                        provider_1.hideText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
