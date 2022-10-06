import 'package:get/get.dart';
import 'package:logger/logger.dart';

class Dimensions{
  static double screenHeight = Get.height;
  static double screenWidth = Get.width;


  static double sHeight1 = screenHeight * 0.1;
  static double sHeight2 = screenHeight * 0.2;
  static double sHeight3 = screenHeight * 0.3;
  static double sHeight4 = screenHeight * 0.4;
  static double sHeight5 = screenHeight * 0.5;
  static double sHeight6 = screenHeight * 0.6;
  static double sHeight7 = screenHeight * 0.7;
  static double sHeight8 = screenHeight * 0.8;
  static double sHeight9 = screenHeight * 0.9;

  static double sWidth1 = screenWidth * 0.1;
  static double sWidth2 = screenWidth * 0.2;
  static double sWidth3 = screenWidth * 0.3;
  static double sWidth4 = screenWidth * 0.4;
  static double sWidth5 = screenWidth * 0.5;
  static double sWidth6 = screenWidth * 0.6;
  static double sWidth7 = screenWidth * 0.7;
  static double sWidth8 = screenWidth * 0.8;
  static double sWidth9 = screenWidth * 0.9;

  static double font10 = screenHeight/84.2;
  static double font12 = screenHeight/65.75;
  static double font14 = screenHeight/62.75;
  static double font16 = screenHeight/52.75;
  static double font20 = screenHeight/42.2;
  static double font26 = screenHeight/32.46;
  static double font32 = screenHeight/26.3;

  static double radius15  = screenHeight/56.26;
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;

  static double iconSize16  = screenHeight/52.75;
  static double iconSize24 = screenHeight/35.16;

  // list view size
  static double listViewImgSize = screenWidth/3.25;
  static double listViewContSize = screenWidth/3.9;

  // populer food
  static double popularFoodImgSize = screenHeight/2.41;

  // Bottom height

  static double bottomHeightBar =  screenHeight/7.03;


  static const kDefaultPadding = 20.0;

  static var logger = Logger();


  static getAdaptiveTextSize(dynamic value) {
    return (value / 720) * screenHeight;
  }
}