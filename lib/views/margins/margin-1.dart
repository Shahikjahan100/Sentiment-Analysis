import 'package:flutter/material.dart';

EdgeInsets getResponsiveMargins(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return EdgeInsets.only(
    top: screenSize.height * 0.01,
    left: screenSize.width * 0.05,
    right: screenSize.width * 0.05,
    bottom: screenSize.height * 0,
  );
}

EdgeInsets getResponsiveMargins_1(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return EdgeInsets.only(
    top: screenSize.height * 0.09, //20%
    left: screenSize.width * 0.05, //1%
    right: screenSize.width * 0.05, //1%
    bottom: screenSize.height * 0, //2%
  );
}

EdgeInsets getResponsiveMargins_2(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return EdgeInsets.only(
    top: screenSize.height * 0.4, //20%
    left: screenSize.width * 0.05, //1%
    right: screenSize.width * 0.05, //1%
    bottom: screenSize.height * 0.092, //2%
  );
}

EdgeInsets getResponsiveMargins_3(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return EdgeInsets.only(
    top: screenSize.height * 0.04,
    left: screenSize.width * 0.05,
    right: screenSize.width * 0.005,
    bottom: screenSize.height * 0,
  );
}

EdgeInsets getResponsiveMargins_4(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return EdgeInsets.only(
    top: screenSize.height * 0.04,
    left: screenSize.width * 0.01,
    right: screenSize.width * 0.05,
    bottom: screenSize.height * 0,
  );
}
