import 'package:emotion_recognition/views/Textstyle/textstyle-1.dart';
import 'package:emotion_recognition/views/margins/margin-1.dart';
import 'package:emotion_recognition/views/widgets/button.dart';
import 'package:emotion_recognition/views/widgets/otp_input.dart';
import 'package:emotion_recognition/views/widgets/text.dart';
import 'package:flutter/material.dart';

class otp extends StatefulWidget {
  const otp({Key? key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  String? _otp;

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = const EdgeInsets.all(16.0);
    EdgeInsets margin_1 = getResponsiveMargins(context);
    EdgeInsets margin_2 = getResponsiveMargins_1(context);
    EdgeInsets margin_3 = getResponsiveMargins_3(context);
    EdgeInsets margin_4 = getResponsiveMargins_4(context);

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

                //ADDING SIGN-IN TEXT
                Container(
                  margin: margin_1,
                  child: customTextWidget(
                    customStyle: CustomStyle(
                      text: "Enter OTP",
                      color: Colors.black,
                      size: 20,
                    ),
                    weight: FontWeight.bold,
                  ),
                ),
                //ADDING TEXT OF ENTER THE OTP CODE

                Container(
                  margin: margin_1,
                  child: customTextWidget(
                    customStyle: CustomStyle(
                      text: "Enter the OTP code we just sent",
                      color: Colors.grey,
                      size: 12,
                    ),
                    weight: FontWeight.normal,
                  ),
                ),
                //ADDING TEXT OF YOU ON YOUR REGISTERED EMAIL/MOBILE NUMBER

                Container(
                  margin: margin_1,
                  child: customTextWidget(
                    customStyle: CustomStyle(
                      text: "you on your registered Email",
                      color: Colors.grey,
                      size: 12,
                    ),
                    weight: FontWeight.normal,
                  ),
                ),
                //ADDING SIZE BOX
                const SizedBox(height: 30),
                //ADDING TEXT OF OTP WE GET OF SEPARATED 5 COLUMNS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpInput(_fieldOne, true), // auto focus
                    OtpInput(_fieldTwo, false),
                    OtpInput(_fieldThree, false),
                    OtpInput(_fieldFour, false),
                    OtpInput(_fieldFive, false),
                    OtpInput(_fieldSix, false),
                  ],
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
                      setState(() {
                        _otp = _fieldOne.text +
                            _fieldTwo.text +
                            _fieldThree.text +
                            _fieldFour.text;
                      });
                    },
                    color: Colors.white,
                    height: 50,
                    width: 350,
                  ),
                ),

                //ADDING TEXT AND LINK OF DIDN'T GET OTP? RESEND OTP
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //ADDING TEXT OF DIDN'T GET OTP
                    Container(
                      margin: margin_3,
                      child: customTextWidget(
                        customStyle: CustomStyle(
                          text: "Didn't get OTP?",
                          size: 12,
                          color: Colors.black,
                        ),
                        weight: FontWeight.normal,
                      ),
                    ),
                    Container(
                      margin: margin_4,
                      child: GestureDetector(
                        onTap: () {
                          // Implement your Resend OTP logic here.....
                        },
                        child: customTextWidget(
                          customStyle: CustomStyle(
                            text: "Resend OTP",
                            size: 15,
                            color: Colors.blue,
                          ),
                          weight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
