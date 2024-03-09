import 'package:emotion_recognition/authentication/signin_auth.dart';

import 'package:emotion_recognition/fields_checks.dart/fields_filled.dart';
import 'package:emotion_recognition/messages/snackbar.dart';
import 'package:emotion_recognition/views/Textstyle/textstyle-1.dart';
import 'package:emotion_recognition/views/margins/margin-1.dart';
import 'package:emotion_recognition/views/pages/HomeScreen.dart';
import 'package:emotion_recognition/views/pages/forgot_password.dart';

import 'package:emotion_recognition/views/pages/signup.dart';
import 'package:emotion_recognition/views/widgets/button.dart';
import 'package:emotion_recognition/views/widgets/text.dart';
import 'package:emotion_recognition/views/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = const EdgeInsets.all(16.0);
    EdgeInsets margin_1 = getResponsiveMargins(context);
    EdgeInsets margin_2 = getResponsiveMargins_1(context);
    EdgeInsets margin_3 = getResponsiveMargins_3(context);
    EdgeInsets margin_4 = getResponsiveMargins_4(context);

    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return ChangeNotifierProvider(
      create: (context) => FieldsFilled(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: margin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Container(
                      margin: margin_1,
                      child: customTextWidget(
                        customStyle: CustomStyle(
                          text: "welcome back!!!",
                          color: Colors.grey,
                          size: 15,
                        ),
                        weight: FontWeight.normal,
                      ),
                    ),
                    Container(
                      margin: margin_1,
                      child: customTextWidget(
                        customStyle: CustomStyle(
                          text: "Sign in",
                          color: Colors.black,
                          size: 20,
                        ),
                        weight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
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
                    Container(
                      margin: margin_1,
                      child: customTextField(
                        hintText: "Enter email address",
                        controller: email,
                        onChanged: (value) {},
                        bool: false,
                      ),
                    ),
                    const SizedBox(height: 20),

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
                      child: PasswordTextField(
                        hintText: "Enter Password",
                        controller: password,
                        onChanged: (value) {},
                      ),
                    ),
                    //PASSWORD MATCHED STRING
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: margin_1,
                          child: Consumer<FieldsFilled>(
                            builder: (context, provider_1, child) {
                              return Text(
                                provider_1.messageIn,
                                style: TextStyle(
                                  color: provider_1.allFilled
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    //ADDING ROW WHERE WE HAVE SIGN-UP OPTION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: margin_3,
                          child: customTextWidget(
                            customStyle: CustomStyle(
                              text: "Don't have an account?",
                              size: 15,
                              color: Colors.black,
                            ),
                            weight: FontWeight.normal,
                          ),
                        ),
                        Container(
                          margin: margin_4,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const signup()),
                              );
                            },
                            child: customTextWidget(
                              customStyle: CustomStyle(
                                text: "SignUp",
                                size: 15,
                                color: Colors.blue,
                              ),
                              weight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: margin_1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const forgot_password(),
                                ),
                              );
                            },
                            child: customTextWidget(
                              customStyle: CustomStyle(
                                text: "Forgot Password?",
                                size: 15,
                                color: Colors.blue,
                              ),
                              weight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //SIGN IN BUTTON
                    Container(
                      margin: margin_1,
                      child: Consumer<FieldsFilled>(
                        builder: (context, provider_1, child) {
                          return CustomButton(
                            text: "Sign In",
                            onPressed: () async {
                              provider_1.emailSignIn = email.text.trim();
                              provider_1.passwordSignIn = password.text.trim();
                              provider_1.checkSignIn();
                              if (provider_1.allFilled) {
                                String email_text = email.text.trim();
                                String password_text = password.text.trim();
                                User? user = await AuthService
                                    .signInWithEmailAndPassword(
                                  email_text,
                                  password_text,
                                );
                                if (user != null) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                } else {
                                  showDismissableSnackBar(
                                      context, "Error while signing in...");
                                }
                              }
                            },
                            color: Colors.white,
                            height: 50,
                            width: 350,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
