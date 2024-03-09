import 'package:emotion_recognition/authentication/change_password.dart';
import "package:flutter/material.dart";
import 'package:emotion_recognition/views/Textstyle/textstyle-1.dart';
import 'package:emotion_recognition/views/margins/margin-1.dart';
import 'package:emotion_recognition/views/widgets/button.dart';
import 'package:emotion_recognition/views/widgets/text.dart';
import 'package:emotion_recognition/views/widgets/textfield.dart';

class forgot_password extends StatelessWidget {
  const forgot_password({Key? key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = const EdgeInsets.all(16.0);
    EdgeInsets margin_1 = getResponsiveMargins(context);
    EdgeInsets margin_2 = getResponsiveMargins_1(context);

    TextEditingController email = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: margin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //ADDING ICON WITH APP-NAME
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
                //ADDING WELCOME TEXT

                //ADDING SIGN-IN TEXT
                Container(
                  margin: margin_1,
                  child: customTextWidget(
                    customStyle: CustomStyle(
                      text: "Forgot Password",
                      color: Colors.black,
                      size: 20,
                    ),
                    weight: FontWeight.bold,
                  ),
                ),
                //ADDING TEXT OF VALID REGISTERED EMAIL
                Container(
                  margin: margin_1,
                  child: customTextWidget(
                    customStyle: CustomStyle(
                      text: "Enter a valid and registered email",
                      color: Colors.grey,
                      size: 15,
                    ),
                    weight: FontWeight.normal,
                  ),
                ),
                //ADDING SIZE BOX
                const SizedBox(height: 30),
                //ADDING TEXT FOR EMAIL
                Container(
                  margin: margin_1,
                  child: customTextWidget(
                    customStyle: CustomStyle(
                      text: "Email",
                      color: Colors.grey,
                      size: 20,
                    ),
                    weight: FontWeight.bold,
                  ),
                ),
                //ADDING TEXTFIELD FOR EMAIL
                Container(
                  margin: margin_1,
                  child: customTextField(
                    hintText: "Enter email address",
                    controller: email,
                    onChanged: (value) {},
                    bool: false,
                  ),
                ),

                //ADDING SIGN-IN BUTTON
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: margin_1,
                  child: CustomButton(
                    text: "Sign In",
                    onPressed: () {
                      sendPasswordResetEmail(
                        context,
                        email.text.trim(),
                      );
                    },
                    color: Colors.white,
                    height: 50,
                    width: 350,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
