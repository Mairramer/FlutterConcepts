import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/internationalization/app_localization.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['pt', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localizations = AppLocalization(locale);
    await localizations.loadJson();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}
