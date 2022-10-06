import 'package:flutter/material.dart';

class AppColors{

  static const kPrimaryColor = Color(0xFF1792da);
  static const kSecondaryColor = Color(0xFFF5F6FC);
  static const kBgLightColor = Color(0xFFF2F4FC);
  static const kBgDarkColor = Color(0xFFEBEDFA);
  static const kBadgeColor = Color(0xFFEE376E);
  static const kGrayColor = Color(0xFF8793B2);
  static const kTitleTextColor = Color(0xFF1c2e4b);
  static const kTextColor = Color(0xFF4D5875);

  static const mainBG = Color(0xFFf6fbfb);

  static const LinearGradient mainButton = LinearGradient(colors: [
    Color.fromRGBO(236, 60, 3, 1),
    Color.fromRGBO(234, 60, 3, 1),
    Color.fromRGBO(216, 78, 16, 1),
  ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

}