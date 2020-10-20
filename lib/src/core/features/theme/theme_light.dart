// ignore: implementation_imports
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter_gofast/src/core/consts/colors_const.dart';
import '../../interfaces/theme_app_interface.dart';

// ignore: public_member_api_docs
class ThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData(
        fontFamily: 'Google',
        scaffoldBackgroundColor: Colors.white,
        primaryColor: ColorsConst.primaryColor,
        buttonColor: ColorsConst.primaryColor,
        buttonTheme: ButtonThemeData(
            height: 50,
            minWidth: double.infinity,
            buttonColor: ColorsConst.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            textTheme: ButtonTextTheme.primary));
  }

  @override
  String themeToString() {
    return ThemeMode.light.toString();
  }
}
