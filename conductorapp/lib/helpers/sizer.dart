import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sizer {
  double height({required context, required double height}) {
    var h = height * 0.01;
    double result = MediaQuery.of(context).size.height * h;
    return result;
  }

  double width({required context, required double width}) {
    var h = width * 0.01;
    double result = MediaQuery.of(context).size.width * h;
    return result;
  }

  double font({required context, required double fontsize}) {
    double result = MediaQuery.of(context).textScaleFactor * fontsize;
    return result;
  }
}
