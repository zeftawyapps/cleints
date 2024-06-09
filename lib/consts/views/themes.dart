import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
      primaryColorLight: LightColors.primaryColors,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: LightColors.primaryColors,
      ),
      brightness: Brightness.light,

      primaryColor: LightColors.primaryColors,
      appBarTheme: const AppBarTheme(
        backgroundColor: LightColors.appBar,
        titleTextStyle: TextStyle(
          color: LightColors.appBarText,
          fontSize: 15,
        ),
        iconTheme: IconThemeData(
          size: 25,
          color: Color(0xfff7eeee),
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: LightColors.drawer,
      ),

      iconTheme: IconThemeData(
        color: LightColors.iconColor,
        size: 5.sp,
      ),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 5.sp,
            color: Color(0xFF383839),
          ),
          labelStyle: TextStyle(
            color: LightColors.hintColor,
            fontSize: 8.sp,
          ),
          filled: true,
          fillColor: LightColors.textFields,
          // focusColor: DasgbordColors.textFieldsFoucs,
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
          )));
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.light,
      primaryColorDark: DarkColors.primaryColors,

      primaryColor: DarkColors.primaryColors,
      appBarTheme: AppBarTheme(
        backgroundColor: DarkColors.background1,
        titleTextStyle: TextStyle(
          color: DarkColors.appBarText,
          fontSize: 24.sp,
        ),
        iconTheme: IconThemeData(
          color: Color(0xfff7eeee),
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: DarkColors.drawer,
      ),

      iconTheme: IconThemeData(
        color: DarkColors.iconColor,
        size: 35.sp,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: DarkColors.hintColor,
          fontSize: 15.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DarkColors.dividerColor, width: 1),
        ),
      ));
}
