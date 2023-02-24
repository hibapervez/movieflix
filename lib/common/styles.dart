import 'package:flutter/material.dart';

class AppStyles {
  static const String font = "Poppins";

  static TextStyle lightTextStyle({double? fontSize, Color? color}) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: font, fontWeight: FontWeight.w300);
  }

  static TextStyle regularTextStyle({double? fontSize, Color? color}) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: font, fontWeight: FontWeight.w400);
  }

  static TextStyle mediumTextStyle({double? fontSize, Color? color, double? letterSpacing, double? height}) {
    return TextStyle(
      color: color,
      height: height,
      fontSize: fontSize,
      fontFamily: font,
      fontWeight: FontWeight.w400,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle semiBoldTextStyle({double? fontSize, Color? color}) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: font, fontWeight: FontWeight.w600);
  }

  static TextStyle boldTextStyle({double? fontSize, Color? color}) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: font, fontWeight: FontWeight.w800);
  }

}