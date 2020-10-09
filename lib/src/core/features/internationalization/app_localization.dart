import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'app_localization_delegate.dart';

// ignore: public_member_api_docs
class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  Map<String, String> _localizationStrings;

  Future<bool> loadJson() async {
    String jsonString =
        await rootBundle.loadString("lang/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    _localizationStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizationStrings[key];
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      AppLocalizationsDelegate();
}
