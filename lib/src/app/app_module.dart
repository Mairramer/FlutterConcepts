import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/auth/auth_controller.dart';
import 'package:flutter_gofast/src/core/consts/routers_const.dart';
import 'package:flutter_gofast/src/core/interfaces/auth_repository_interface.dart';
import 'package:flutter_gofast/src/core/interfaces/shared_repository_interface.dart';
import 'package:flutter_gofast/src/core/repositories/auth_repository.dart';
import 'package:flutter_gofast/src/modules/intro/intro_module.dart';
import 'package:flutter_gofast/src/modules/login/login_module.dart';
import 'package:flutter_gofast/src/modules/register/register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/repositories/shared_repository.dart';
import '../modules/home/home_module.dart';
import '../modules/splash/splash_page.dart';
import 'app_controller.dart';
import 'app_widget.dart';

// ignore: public_member_api_docs
class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  List<Bind> get binds => [
        // Repositories
        Bind<ISharedPrederenceInterface>(
          (i) => SharedRepository(),
        ),
        Bind<IAuthRepository>(
          (i) => AuthRepository(firebaseAuth),
        ),
        // Controllers
        Bind(
          (i) => AppController(),
        ),
        Bind(
          (i) => AuthController(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(RoutersConst.splash,
            child: (_, args) => SplashPage(),
            transition: TransitionType.noTransition),
        ModularRouter(RoutersConst.home, module: HomeModule()),
        ModularRouter(RoutersConst.intro, module: IntroModule()),
        ModularRouter(RoutersConst.login, module: LoginModule()),
        ModularRouter(RoutersConst.register, module: RegisterModule())
      ];
}
