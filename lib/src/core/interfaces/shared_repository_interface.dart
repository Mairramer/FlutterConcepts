import 'package:flutter/material.dart';

// ignore: public_member_api_docs
abstract class ISharedPrederenceInterface {
  // ignore: public_member_api_docs
  String? getUserInfo();

  // ignore: public_member_api_docs
  saveUserInfo(String userInfo);

  // ignore: public_member_api_docs
  Future<ThemeMode> getThemeMode();
  // ignore: public_member_api_docs
  Future<bool> saveThemeMode(ThemeMode themeMode);
}
