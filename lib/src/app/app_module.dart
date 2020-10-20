import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/consts/routers_const.dart';
import 'package:flutter_gofast/src/modules/intro/intro_module.dart';
import 'package:flutter_gofast/src/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/interfaces/shared_repository_interface.dart';
import '../core/repositories/shared_repository.dart';
import '../modules/home/home_module.dart';
import '../modules/splash/splash_page.dart';
import 'app_controller.dart';
import 'app_widget.dart';

// ignore: public_member_api_docs
class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<ISharedPrederenceInterface>((i) => SharedRepository())
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(RoutersConts.splash,
            child: (_, args) => SplashPage(),
            transition: TransitionType.noTransition),
        ModularRouter(RoutersConts.home, module: HomeModule()),
        ModularRouter(RoutersConts.intro, module: IntroModule()),
        ModularRouter(RoutersConts.login, module: LoginModule())
      ];
}
