import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/features/internationalization/app_localization.dart';

class AppTranslator {
  final BuildContext context;

  AppTranslator(this.context);

  String text(String key) {
    return AppLocalization.of(context).translate(key);
  }
}
