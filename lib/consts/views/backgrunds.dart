

import 'package:flutter/cupertino.dart';

import 'colors.dart';


class Backgrounds {
  static LinearGradient screenBackGround() {
    return LinearGradient(
        colors: [DashbordColors.secondryColors, DashbordColors.secondryColors],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
    );
  }

  static LinearGradient splashScreenBackGround() {
    return LinearGradient(
        colors: [LightColors.background1, LightColors.backgroundCenter],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
    );
  }


  static LinearGradient bottonBackGround() {
    return LinearGradient(
        colors: [DashbordColors.bottonbegn, DashbordColors.bottonEnd],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
    );
  }

  static LinearGradient bottonBackGround2() {
    return LinearGradient(
        colors: [DashbordColors.bottonbegn2, DashbordColors.bottonEnd2],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
    );
  }


  static LinearGradient headerBackGround() {
    return LinearGradient(colors: [
      FixedColors.headerFooterColors1,
      FixedColors.headerFooterColors2,
      FixedColors.headerFooterColors3
    ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
    );
  }

  static LinearGradient footerBackGround() {
    return LinearGradient(colors: [
      FixedColors.headerFooterColors3,
      FixedColors.headerFooterColors2,
      FixedColors.headerFooterColors1
    ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
    );
  }
}