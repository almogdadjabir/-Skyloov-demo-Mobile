import 'dart:async';
import 'package:get/get.dart';

import '../../../home/presentation/pages/main.dart';


class SplashController extends GetxController {

  @override
  void onInit() {
    Timer(
        const Duration(seconds: 4),
            ()=>Get.offAll(const Main())
    );
    super.onInit();
  }

}