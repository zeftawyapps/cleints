
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app-configs.dart';
import 'app_louncher.dart';






void main() async {
 await  appInit();
  runApp(const AppLouncher());
}
appInit() async {
  AppConfigration.appType = AppType.App;
  AppConfigration.envType = EnvType.dev;
  String lang = "ar";
  AppConfigration.backendState = BackendState.remote;
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfigration.FirebaseInit();
  await AppConfigration.backenRoutsdInit();
  AppConfigration.setAppLocal(lang);


}
