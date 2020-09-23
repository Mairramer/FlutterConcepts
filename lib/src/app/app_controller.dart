import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/features/theme/app_theme_factor.dart';
import 'package:flutter_gofast/src/core/interfaces/shared_repository_interface.dart';
import 'package:flutter_gofast/src/core/interfaces/theme_app_interface.dart';
import 'package:flutter_gofast/src/core/repositories/shared_repository.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  SharedRepository sharedRepository = Modular.get<ISharedPrederenceInterface>();
  _AppControllerBase() {
    loadThemeData();
  }

  @action
  loadThemeData() async {
    await sharedRepository.getThemeMode().then(
      (themeMode) {
        themeApp = AppThemeFactory.getTheme(themeMode);
        setThemeData(themeMode, saveShared: false);
      },
    );
  }

  @observable
  IThemeAppInterface themeApp = AppThemeFactory.getTheme(ThemeMode.light);

  @action
  setThemeData(ThemeMode themeMode, {bool saveShared = true}) async {
    themeApp = AppThemeFactory.getTheme(themeMode);
    if (saveShared) {
      await sharedRepository.saveThemeMode(themeMode);
    }
  }
}
