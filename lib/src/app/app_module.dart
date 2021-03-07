// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/auth/auth_controller.dart';
import 'package:flutter_gofast/src/core/consts/routers_const.dart';

import 'package:flutter_gofast/src/core/interfaces/auth_repository_interface.dart';
import 'package:flutter_gofast/src/core/interfaces/shared_repository_interface.dart';
import 'package:flutter_gofast/src/core/repositories/auth_repository.dart';
import 'package:flutter_gofast/src/modules/home/home_page.dart';
import 'package:flutter_gofast/src/modules/intro/intro_page.dart';
import 'package:flutter_gofast/src/modules/login/login_page.dart';
import 'package:flutter_gofast/src/modules/register/register_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../core/repositories/shared_repository.dart';

import '../modules/splash/splash_page.dart';
import 'app_controller.dart';
import 'app_widget.dart';

// ignore: public_member_api_docs
class AppModule extends Module {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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

  Widget get bootstrap => AppWidget();

  @override
  final List<ModularRoute> routes = [
    ChildRoute(RoutersConst.splash,
        child: (_, args) => SplashPage(),
        transition: TransitionType.noTransition),
    ChildRoute(RoutersConst.home, child: (_, __) => HomePage()),
    ChildRoute(RoutersConst.intro, child: (_, __) => IntroPage()),
    ChildRoute(RoutersConst.login, child: (_, __) => LoginPage()),
    ChildRoute(RoutersConst.register, child: (_, __) => RegisterPage())
  ];
}
