import 'package:JoDija_DataSource/https/http_urls.dart';
import 'package:JoDija_view/util/jsonengen/json_asset_reader.dart';
import 'package:JoDija_view/util/localization/loaclized_init.dart';
import 'package:cleints/screens/home_screen.dart';
import 'package:cleints/screens/logIn_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;



import 'consts/views/assets.dart';
import 'loclization/app_localizations.dart';
import 'loclization/app_localizations_ar.dart';
import 'loclization/app_localizations_en.dart';



abstract class AppConfigration {
  static AppType appType = AppType.App;
  static EnvType envType = EnvType.dev;
  static BackendState backendState = BackendState.remote;

  static Future FirebaseInit() async {
    try {
      var data =
      await JsonAssetReader(path: AppConfigAssets.firebaseConfig).data;
      var firebaseConfig = data['firebaseConfig'];
      if (envType == EnvType.prod) {
        var prod = firebaseConfig['prod'];
        await Firebase.initializeApp(
            options: FirebaseOptions(
                apiKey: prod['apiKey'],
                appId: prod['appId'],
                messagingSenderId: prod['messagingSenderId'],
                projectId: prod['projectId'],
                storageBucket: prod['storageBucket']));
      } else {
        var dev = firebaseConfig['dev'];
        await Firebase.initializeApp(
            options: FirebaseOptions(
                apiKey: dev['apiKey'],
                appId: dev['appId'],
                messagingSenderId: dev['messagingSenderId'],
                projectId: dev['projectId'],
                storageBucket: dev['storageBucket']));
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  static Future backenRoutsdInit() async {
    var data = await JsonAssetReader(path: AppConfigAssets.BaseUrl).data;
    var baseUrls = data['baseUrls'];
    String BaseUrl;

    if (backendState == BackendState.local) {
      BaseUrl = baseUrls['local'];
    } else {
      BaseUrl = baseUrls['remote'];
    }
    HttpUrlsEnveiroment(baseUrl: BaseUrl);
  }

  static Widget _launchWidget({required Widget web, required Widget mobile}) {
    if (kIsWeb) {
      return web;
    } else {
      return mobile;
    }
  }

  static Widget _launchWeb({required Widget web, required Widget dashboard}) {
    if (appType == AppType.App) {
      return web;
    } else {
      return dashboard;
    }
  }

  static Widget launchScreen() {
    return _launchWidget(
        web: _launchWeb(
          web: LoginScreen(),
          dashboard: LoginScreen(),
        ),
        mobile: LoginScreen());
  }
// static String baseRoute() {
//   if (!kIsWeb) {
//     if (appType == AppType.App) {
//       return LandingPageClasicMode.path;
//     } else {
//       return DashBoardSplashScreen.path;
//     }
//
//   } else {
//     if (appType == AppType.App) {
//       return LandingPageClasicMode.path;
//     } else {
//       return DashBoardSplashScreen.path;
//     }
//   }
// }

static void setAppLocal (String localCode){
    LocalizationConfig localizationConfig = LocalizationConfig(localizedValues: {
      'ar': AppLocalizationsAr(),
      'en': AppLocalizationsEn(),
    });
    localizationConfig.setLocale(Locale(localCode));
Translation().getlocal();
}
}

enum AppType { DashBord, App }

enum EnvType { localDev, dev, prod }

enum BackendState { local, remote }
