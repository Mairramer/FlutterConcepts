import 'package:flutter_gofast/src/core/consts/routers_const.dart';
import 'package:flutter_gofast/src/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => HomeController())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => HomePage(),
        ),
        ModularRouter(RoutersConst.login, module: LoginModule()),
      ];
  static Inject get to => Inject<HomeModule>.of();
}
