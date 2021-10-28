import 'package:conductorapp/pages/splashscreen/splashscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.redAccent,
      debugShowCheckedModeBanner: false,
      title: 'Pabama App',
      home: SplashScreen(),
      locale: const Locale('en', 'US'),
      defaultTransition: Transition.cupertino,
    );
  }
}
