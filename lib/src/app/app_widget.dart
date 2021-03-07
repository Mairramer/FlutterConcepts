import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/consts/routers_const.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/features/internationalization/app_localization.dart';
import 'app_controller.dart';

// ignore: public_member_api_docs
class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Flutter Modular',
        initialRoute: RoutersConst.home,
        theme: Modular.get<AppController>().themeApp.getTheme(),
        themeMode: Modular.get<AppController>().themeMode,
        supportedLocales: [Locale('en', 'US'), Locale('pt', 'BR')],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      );
    });
  }
}
