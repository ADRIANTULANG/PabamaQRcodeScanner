import 'package:conductorapp/pages/homepage/Home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conductorapp/pages/loginpage/login_api.dart';
import 'package:conductorapp/pages/loginpage/login_model.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  RxList<User> userInfo = <User>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    try {
      var result = await LoginApi.loginApi(
        username: username.text,
        password: password.text,
      );
      userInfo.assignAll(result);
      if (userInfo.length != 0) {
        Get.to(() => HomeView(), arguments: {
          "userid": userInfo[0].userid,
          "username": userInfo[0].username,
          "password": userInfo[0].password,
          "busid": userInfo[0].busid,
          "conductor_name": userInfo[0].conductor_name,
        });
      }
    } catch (error) {
      if (error == true) {}
    } finally {}
  }
}
