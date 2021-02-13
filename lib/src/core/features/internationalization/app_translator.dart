import 'package:flutter/material.dart';
import 'app_localization.dart';

// ignore: public_member_api_docs
class AppTranslator {
  final BuildContext context;

  AppTranslator(this.context);

  String text(String key,
      {Map<String, String> params, String defaultValue = ''}) {
    return AppLocalizations.of(context)
        .translate(key, params: params, defaultValue: defaultValue);
  }
}
