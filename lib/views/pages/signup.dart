import 'package:emotion_recognition/fields_checks.dart/fields_filled.dart';

import 'package:emotion_recognition/views/Textstyle/textstyle-1.dart';
import 'package:emotion_recognition/views/margins/margin-1.dart';
import 'package:emotion_recognition/views/widgets/button.dart';
import 'package:emotion_recognition/views/widgets/text.dart';
import 'package:emotion_recognition/views/widgets/textfield.dart';
import 'package:flutter/material.dart';
import "package:emotion_recognition/authentication/authentic_user.dart";
import "package:provider/provider.dart";

class signup extends StatelessWidget {
  const signup({Key? key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = EdgeInsets.all(16.0);
    EdgeInsets margin_1 = getResponsiveMargins(context);
    EdgeInsets margin_2 = getResponsiveMargins_1(context);

    TextEditingController fullName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    return ChangeNotifierProvider<FieldsFilled>(
      create: (context) => FieldsFilled(),
      child: Builder(
        builder: (context) {
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
                      Container(
                        margin: margin_1,
                        child: customTextWidget(
                          customStyle: CustomStyle(
                            text: "Welcome to sentiment analysis system",
                            color: Colors.grey,
                            size: 15,
                          ),
                          weight: FontWeight.normal,
                        ),
                      ),
                      //ADDING SIGN-IN TEXT
                      Container(
                        margin: margin_1,
                        child: customTextWidget(
                          customStyle: CustomStyle(
                            text: "Sign up",
                            color: Colors.black,
                            size: 20,
                          ),
                          weight: FontWeight.bold,
                        ),
                      ),
                      //ADDING SIZE BOX
                      const SizedBox(height: 30),
                      //ADDING TEXT FOR FULL NAME
                      Container(
                        margin: margin_1,
                        child: customTextWidget(
                          customStyle: CustomStyle(
                            text: "Full Name",
                            color: Colors.grey,
                            size: 20,
                          ),
                          weight: FontWeight.bold,
                        ),
                      ),
                      //ADDING TEXTFIELD FOR FULL NAME
                      Container(
                        margin: margin_1,
                        child: customTextField(
                          hintText: "Enter your full name",
                          controller: fullName,
                          onChanged: (value) {},
                          bool: false,
                        ),
                      ),
                      // const SizedBox(height: 10),
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

                      // const SizedBox(height: 10),
                      //ADDING TEXT FOR PASSWORD
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
                        child: PasswordTextField(
                          hintText: "Enter Password",
                          controller: password,
                          onChanged: (value) {},
                        ),
                      ),
                      //ADDING CONFIRM PASSWORD TEXT
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
                      //ADDING CONFIRM PASSWORD TEXTFIELD
                      Container(
                        margin: margin_1,
                        child: PasswordTextField(
                          hintText: "Re-type Password",
                          controller: confirmPassword,
                          onChanged: (value) {},
                        ),
                      ),

                      //PASSWORD MATCHED STRING
                      Container(
                        margin: margin_1,
                        child: Consumer<FieldsFilled>(
                          builder: (context, provider_1, child) {
                            return Text(
                              provider_1.textMessage,
                              style: TextStyle(
                                color: provider_1.color
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            );
                          },
                        ),
                      ),

                      //ADDING SIGN-IN BUTTON
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: margin_1,
                        child: Consumer<FieldsFilled>(
                          builder: (context, provider_1, child) {
                            return CustomButton(
                              text: "Sign up",
                              onPressed: () {
                                provider_1.fullName = fullName.text;
                                provider_1.email = email.text;
                                provider_1.password = password.text;
                                provider_1.confirmPassword =
                                    confirmPassword.text;

                                provider_1.passwordMatched();
                                if (provider_1.validated == true) {
                                  //PERFORMING SIGN-UP FUNCTIONS HERE.....
                                  signUpWithEmailAndPassword(
                                    context,
                                    fullName.text,
                                    email.text,
                                    password.text,
                                  );
                                }
                              },
                              color: Colors.white,
                              height: 50,
                              width: 350,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
