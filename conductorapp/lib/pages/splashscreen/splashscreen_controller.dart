import 'dart:async';
import 'package:conductorapp/pages/loginpage/login_view.dart';
import 'package:get/get.dart';

class SplashScreenControlller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateAfterView();
  }

  navigateAfterView() {
    Timer(Duration(seconds: 6), () {
      Get.offAll(() => LoginView());
    });
  }
}
