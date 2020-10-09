// ignore: implementation_imports
import 'package:flutter/src/material/theme_data.dart';
import '../../interfaces/theme_app_interface.dart';

// ignore: public_member_api_docs
class ThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData.light();
  }
}
