import 'package:conductorapp/helpers/sizer.dart';
import 'package:flutter/material.dart';
import 'package:conductorapp/pages/loginpage/login_controller.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var sizer = Sizer();
    Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.topCenter,
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.black,
                  height: sizer.height(context: context, height: 40),
                  width: sizer.width(context: context, width: 100),
                  child: Container(
                      child: Image.asset('assets/images/splashscreen.jpeg')),
                ),
                Container(
                  height: h * 0.60,
                  width: w * 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.10,
                      ),
                      Container(
                        height: h * 0.10,
                        width: w * 0.80,
                        alignment: Alignment.center,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          cursorColor: Theme.of(context).indicatorColor,
                          controller: controller.username,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          // onEditingComplete: () => _node.nextFocus(),
                          decoration: InputDecoration(
                            // prefixText: '+63',
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            prefixStyle: TextStyle(
                              color: Colors.black,
                            ),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.only(
                              left: 10.0,
                              top: 5.0,
                              right: 5.0,
                              bottom: 5.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).indicatorColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: h * 0.10,
                        width: w * 0.80,
                        alignment: Alignment.center,
                        child: TextField(
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          cursorColor: Theme.of(context).indicatorColor,
                          controller: controller.password,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          // onEditingComplete: () => _node.nextFocus(),
                          decoration: InputDecoration(
                            // prefixText: '+63',
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            prefixStyle: TextStyle(
                              color: Colors.black,
                            ),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.only(
                              left: 10.0,
                              top: 5.0,
                              right: 5.0,
                              bottom: 5.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).indicatorColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: h * 0.05,
                        width: w * 0.80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black87,
                            primary: Colors.black,
                            // minimumSize: Size(h * 0.20, w * 0.10),
                            // padding: EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          onPressed: () {
                            controller.login();
                          },
                          child: Text(
                            'Log in',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
