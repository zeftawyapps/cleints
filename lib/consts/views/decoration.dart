import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'backgrunds.dart';
import 'colors.dart';
import 'fons.dart';

class DashboardDecorations {
  static BoxDecoration splashBackground =
      BoxDecoration(gradient: Backgrounds.splashScreenBackGround());
  static BoxDecoration screensBackground =
      BoxDecoration(gradient: Backgrounds.screenBackGround());

  static BoxDecoration bottonDecoration = BoxDecoration(
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      gradient: Backgrounds.bottonBackGround(),
      borderRadius: BorderRadius.circular(20));
  static BoxDecoration bottonDecoration2 = BoxDecoration(
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      gradient: Backgrounds.bottonBackGround2(),
      borderRadius: BorderRadius.circular(20));


  static BoxDecoration cardDecoration = BoxDecoration(

      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
        // gradient: Backgrounds.logInBackGround(),
      borderRadius: BorderRadius.circular(0));

  static BoxDecoration alarmTitleDecoration = BoxDecoration(
      color: DashbordColors.alarmTitle, borderRadius: BorderRadius.circular(0));
  static BoxDecoration alarmDialogDecoration = BoxDecoration(
      color: LightColors.backgroundColor,
      borderRadius: BorderRadius.circular(20));

  static TextStyle bottonText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.bottonText,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold);
  static TextStyle bottonWiteText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.lableTextFont,
      fontSize: 20.sp,

      fontWeight: FontWeight.bold);
  static TextStyle textFieldText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.inputTextFont,
      fontSize: 5.sp);

  static TextStyle titleFontStyle = TextStyle(
      fontSize: 20.sp,
      color: DashbordColors.primaryColors,
      fontWeight: FontWeight.bold,
      fontFamily: AppFontFamily.helvetice);
  static TextStyle buttonTextFontStyle = TextStyle(
      fontSize: 5.sp,
      color: DashbordColors.primaryColors,
      fontWeight: FontWeight.bold,
      fontFamily: AppFontFamily.helvetice);
  static InputDecoration textfield2 = InputDecoration(

      filled: true,
      fillColor: DashbordColors.textFields2,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(3.sp),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(3.sp),
      )
  );
  static InputDecoration textfield3 = InputDecoration(

      filled: true,
      fillColor: DashbordColors.textFields,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(3.sp),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(3.sp),
      )
  );


}
class AppDecorations {
  static BoxDecoration splashBackground =
  BoxDecoration(gradient: Backgrounds.splashScreenBackGround());
  static BoxDecoration screensBackground =
  BoxDecoration(gradient: Backgrounds.screenBackGround());

  static BoxDecoration bottonDecoration = BoxDecoration(
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      gradient: Backgrounds.bottonBackGround(),
      borderRadius: BorderRadius.circular(20));
  static BoxDecoration cardDecoration = BoxDecoration(

      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      // gradient: Backgrounds.logInBackGround(),
      borderRadius: BorderRadius.circular(0));

  static BoxDecoration alarmTitleDecoration = BoxDecoration(
      color: DashbordColors.alarmTitle, borderRadius: BorderRadius.circular(0));
  static BoxDecoration alarmDialogDecoration = BoxDecoration(
      color: LightColors.backgroundColor,
      borderRadius: BorderRadius.circular(20));

  static TextStyle bottonText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.bottonText,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold);
  static TextStyle bottonWiteText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.lableTextFont,
      fontSize: 20.sp,

      fontWeight: FontWeight.bold);
  static TextStyle textFieldText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.inputTextFont,
      fontSize: 5.sp);

  static TextStyle titleFontStyle = TextStyle(
      fontSize: 20.sp,
      color: DashbordColors.primaryColors,
      fontWeight: FontWeight.bold,
      fontFamily: AppFontFamily.helvetice);

  static TextStyle buttonTextFontStyle = TextStyle(
      fontSize: 5.sp,
      color: DashbordColors.primaryColors,
      fontWeight: FontWeight.bold,
      fontFamily: AppFontFamily.helvetice);
}

class AppLightDecorations {
  static BoxDecoration splashBackground =
  BoxDecoration(gradient: Backgrounds.splashScreenBackGround());
  static BoxDecoration screensBackground =
  BoxDecoration(gradient: Backgrounds.screenBackGround());

  static BoxDecoration bottonDecoration = BoxDecoration(
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      gradient: Backgrounds.bottonBackGround(),
      borderRadius: BorderRadius.circular(20));
  static BoxDecoration cardDecoration = BoxDecoration(

      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      // gradient: Backgrounds.logInBackGround(),
      borderRadius: BorderRadius.circular(0));

  static BoxDecoration alarmTitleDecoration = BoxDecoration(
      color: DashbordColors.alarmTitle, borderRadius: BorderRadius.circular(0));
  static BoxDecoration alarmDialogDecoration = BoxDecoration(
      color: LightColors.backgroundColor,
      borderRadius: BorderRadius.circular(20));

  static TextStyle bottonText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.bottonText,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold);
  static TextStyle bottonWiteText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.lableTextFont,
      fontSize: 20.sp,

      fontWeight: FontWeight.bold);
  static TextStyle textFieldText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.inputTextFont,
      fontSize: 5.sp);

  static TextStyle titleFontStyle = TextStyle(
      fontSize: 20.sp,
      color: DashbordColors.primaryColors,
      fontWeight: FontWeight.bold,
      fontFamily: AppFontFamily.helvetice);

  static TextStyle buttonTextFontStyle = TextStyle(
      fontSize: 5.sp,
      color: DashbordColors.primaryColors,
      fontWeight: FontWeight.bold,
      fontFamily: AppFontFamily.helvetice);
}
class AppDarkDecorations {
  static BoxDecoration splashBackground =
  BoxDecoration(gradient: Backgrounds.splashScreenBackGround());
  static BoxDecoration screensBackground =
  BoxDecoration(gradient: Backgrounds.screenBackGround());

  static BoxDecoration bottonDecoration = BoxDecoration(
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      gradient: Backgrounds.bottonBackGround(),
      borderRadius: BorderRadius.circular(20));
  static BoxDecoration cardDecoration = BoxDecoration(

      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      // gradient: Backgrounds.logInBackGround(),
      borderRadius: BorderRadius.circular(0));

  static BoxDecoration alarmTitleDecoration = BoxDecoration(
      color: DashbordColors.alarmTitle, borderRadius: BorderRadius.circular(0));
  static BoxDecoration alarmDialogDecoration = BoxDecoration(
      color: LightColors.backgroundColor,
      borderRadius: BorderRadius.circular(20));

  static TextStyle bottonText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.bottonText,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold);
  static TextStyle bottonWiteText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.lableTextFont,
      fontSize: 20.sp,

      fontWeight: FontWeight.bold);
  static TextStyle textFieldText = TextStyle(
      fontFamily: AppFontFamily.helvetice,
      color: DashbordColors.inputTextFont,
      fontSize: 5.sp);

  static TextStyle titleFontStyle = TextStyle(
      fontSize: 20.sp,
      color: DashbordColors.primaryColors,
      fontWeight: FontWeight.bold,
      fontFamily: AppFontFamily.helvetice);

  static TextStyle buttonTextFontStyle = TextStyle(
      fontSize: 5.sp,
      color: DashbordColors.primaryColors,
      fontWeight: FontWeight.bold,
      fontFamily: AppFontFamily.helvetice);
}
