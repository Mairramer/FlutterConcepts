import 'package:flutter/material.dart';

import '../../interfaces/theme_app_interface.dart';
import 'theme_dark.dart';
import 'theme_light.dart';

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
