import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/app/app_controller.dart';
import 'package:flutter_gofast/src/app/app_widget.dart';
import 'package:flutter_gofast/src/core/interfaces/shared_repository_interface.dart';
import 'package:flutter_gofast/src/core/repositories/shared_repository.dart';
import 'package:flutter_gofast/src/modules/home/home_module.dart';
import 'package:flutter_gofast/src/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
        ModularRouter('/',
            child: (_, args) => SplashPage(),
            transition: TransitionType.noTransition),
        ModularRouter('/home', module: HomeModule())
      ];
}
