import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/features/theme/theme_dark.dart';
import 'package:flutter_gofast/src/core/features/theme/theme_light.dart';
import 'package:flutter_gofast/src/core/interfaces/theme_app_interface.dart';

class AppThemeFactory {
  static IThemeAppInterface getTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return ThemeDark();
        break;
      case ThemeMode.light:
        return ThemeLight();
        break;
      default:
        return ThemeLight();
        break;
    }
  }
}
