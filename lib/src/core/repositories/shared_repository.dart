import 'package:flutter/material.dart';
import '../features/local_storage/local_storage.dart';
import '../interfaces/shared_repository_interface.dart';

//pode ser usado para diversas opçoes
class SharedRepository implements ISharedPrederenceInterface {
  static const String THEME_MODE = 'theme_mode';
  static const String THEME_MODE_DARK = 'ThemeMode.dark';
  static const String THEME_MODE_LIGHT = 'ThemeMode.light';

  @override
  String getUserInfo() {
    return null;
  }

  @override
  saveUserInfo(String userInfo) {
    return null;
  }

  @override
  Future<ThemeMode> getThemeMode() async {
    return await LocalStorage.getValue<String>(THEME_MODE).then((value) {
      switch (value) {
        case THEME_MODE_DARK:
          return ThemeMode.dark;
        case THEME_MODE_LIGHT:
          return ThemeMode.light;
        default:
          return ThemeMode.light;
      }
    });
  }

  @override
  Future<bool> saveThemeMode(ThemeMode themeMode) async {
    return await LocalStorage.setValue<String>(
        THEME_MODE, themeMode.toString());
  }
}
