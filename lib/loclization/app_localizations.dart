import 'package:JoDija_view/util/localization/loaclized_init.dart';
import 'package:flutter/cupertino.dart';

class Translation {
  static final Translation _singleton = Translation._internal();
  factory Translation() {
    return _singleton;
  }
  Translation._internal();
  Map<String, AppLocal> transelation = {};
  AppLocal translate() {
    return transelation[LocalizationConfig().locale.languageCode]!;
  }

  AppLocal translateOf(BuildContext context) {
    return AppLocal.of(context);
  }

  void getlocal() {
    var localval = LocalizationConfig().localizedValues;
    localval.forEach((key, value) {
      transelation[key] = value as AppLocal;
    });
  }
}

abstract class AppLocal extends AppLocalizationsInit {
  static AppLocal of(BuildContext context) {
    return Localizations.of<AppLocal>(context, AppLocal)!;
  }

  AppLocal();
  String get email;
  String get password;
  String get titelHeader;
  String get mainTextheader;
  String get connect;
  String get signIn;
  String get signUp;
  String get changeLanguage;
  String get dashbordTitle;
  String get catigory;
  String  get add;
  String get addCatigory;
  String get addProduct;
  String get productName;
  String get productPrice;
}
