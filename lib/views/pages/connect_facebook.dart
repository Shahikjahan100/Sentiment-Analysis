import 'package:flutter/material.dart';
import 'package:emotion_recognition/views/widgets/button.dart';
import 'package:emotion_recognition/views/margins/margin-1.dart';

class ConnectFacebook extends StatelessWidget {
  const ConnectFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin_1 = getResponsiveMargins(context);
    EdgeInsets margin_3 = getResponsiveMargins_2(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //ADDING CONNECTION ICON BETWEEN SENTIMENT ANALYSIS AND FACEBOOK
              Container(
                margin: margin_3,
                child: Image.asset(
                  "assets/connect_facebook.png",
                ),
              ),
              //ADDING CONNECT WITH FACEBOOK BUTTON
              Container(
                margin: margin_1,
                child: CustomButton(
                  text: "Connect With Facebook",
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
