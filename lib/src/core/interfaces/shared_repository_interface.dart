import 'package:flutter/material.dart';

abstract class ISharedPrederenceInterface {
  String getUserInfo();
  saveUserInfo(String userInfo);

  Future<ThemeMode> getThemeMode();
  Future<bool> saveThemeMode(ThemeMode themeMode);
}
