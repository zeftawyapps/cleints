
import 'package:JoDija_view/util/localization/loaclized_init.dart';
import 'package:JoDija_view/util/navigations/animation_types.dart';
import 'package:JoDija_view/util/navigations/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'app-configs.dart';
import 'consts/views/themes.dart';

 class AppLouncher extends StatelessWidget {
  const AppLouncher({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        builder: (context ,  Widget? child) {
          NavigationService ns = NavigationService();
          ns.animationType= AnimationType.slide;
          return MaterialApp(
            debugShowCheckedModeBanner: false ,
            navigatorKey: ns . navigatorKey,
            onGenerateRoute: ns.generateRoute ,
            supportedLocales:  AppLocalizationsInit.supportedLocales,
            locale: AppLocalizationsInit.local,
            // // These delegates make sure that the localization data for the proper language is loaded
             localizationsDelegates: AppLocalizationsInit.localizationsDelegates ,
            theme:  Themes.lightTheme ,
            darkTheme: Themes.darkTheme,
            themeMode: ThemeMode.light,
          home: AppConfigration.launchScreen(),

          );


        }
    );
  }
}
