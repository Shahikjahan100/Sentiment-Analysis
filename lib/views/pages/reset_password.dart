import 'package:emotion_recognition/views/Textstyle/textstyle-1.dart';
import 'package:emotion_recognition/views/margins/margin-1.dart';
import 'package:emotion_recognition/views/widgets/button.dart';
import 'package:emotion_recognition/views/widgets/text.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool passwordVisible_1 = true;
  bool passwordVisible_2 = true;

  EdgeInsets margin = const EdgeInsets.all(16.0);
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  void initState_1() {
    super.initState();
    passwordVisible_1 = true;
    passwordVisible_2 = true;
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin_1 = getResponsiveMargins(context);
    EdgeInsets margin_2 = getResponsiveMargins_1(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //ADDING ICON WITH APP NAME
              Container(
                margin: margin_2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 100,
                    ),
                    customTextWidget(
                      customStyle: CustomStyle(
                        text: "Sentiment Analysis",
                        color: Colors.black,
                        size: 20,
                      ),
                      weight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              //ADDING PASSWORD TEXT
              Container(
                margin: margin_1,
                child: customTextWidget(
                  customStyle: CustomStyle(
                    text: "Reset Password",
                    color: Colors.black,
                    size: 20,
                  ),
                  weight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              //ADDING PASSWORD TEXT
              Container(
                margin: margin_1,
                child: customTextWidget(
                  customStyle: CustomStyle(
                    text: "Password",
                    color: Colors.grey,
                    size: 20,
                  ),
                  weight: FontWeight.bold,
                ),
              ),
              //ADDING TEXTFIELD FOR PASSWORD
              Container(
                margin: margin_1,
                child: TextField(
                  obscureText: passwordVisible_1,
                  onChanged: (value) {},
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible_1 = !passwordVisible_1;
                        });
                      },
                      icon: Icon(
                        passwordVisible_1
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
              ),
              const SizedBox(height: 10),
              //ADDING TEXT FOR CONFIRM PASSWORD
              Container(
                margin: margin_1,
                child: customTextWidget(
                  customStyle: CustomStyle(
                    text: "Confirm Password",
                    color: Colors.grey,
                    size: 20,
                  ),
                  weight: FontWeight.bold,
                ),
              ),
              //ADDING TEXTFIELD FOR CONFIRM-PASSWORD
              Container(
                margin: margin_1,
                child: TextField(
                  obscureText: passwordVisible_2,
                  onChanged: (value) {},
                  controller: confirmPassword,
                  decoration: InputDecoration(
                    hintText: "Re-type password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible_2 = !passwordVisible_2;
                        });
                      },
                      icon: Icon(
                        passwordVisible_2
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //ADDING SIGN-IN BUTTON
              Container(
                margin: margin_1,
                child: CustomButton(
                  text: "Sign In",
                  onPressed: () {},
                  color: Colors.white,
                  height: 50,
                  width: 350,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
