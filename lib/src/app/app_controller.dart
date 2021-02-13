import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../core/features/theme/app_theme_factor.dart';
import '../core/interfaces/shared_repository_interface.dart';
import '../core/interfaces/theme_app_interface.dart';

part 'app_controller.g.dart';

// ignore: public_member_api_docs
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  ISharedPrederenceInterface sharedRepository =
      Modular.get<ISharedPrederenceInterface>();
  _AppControllerBase() {
    loadThemeData();
  }
  @observable
  IThemeAppInterface themeApp = AppThemeFactory.getTheme(ThemeMode.light);

  @observable
  ThemeMode themeMode = ThemeMode.light;

  @action
  loadThemeData() async => await sharedRepository.getThemeMode().then(
        (systemThemeMode) {
          themeMode = systemThemeMode;
          themeApp = AppThemeFactory.getTheme(themeMode);
          setThemeData(systemThemeMode, saveShared: false);
        },
      );

  @action
  setThemeData(ThemeMode themeMode, {bool saveShared = true}) async {
    themeApp = AppThemeFactory.getTheme(themeMode);
    if (saveShared) {
      await sharedRepository.saveThemeMode(themeMode);
    }
  }
}
