import 'package:flutter_gofast/src/core/consts/routers_const.dart';
import 'package:flutter_gofast/src/core/repositories/fake_api_repository.dart';
import 'package:flutter_gofast/src/modules/login/login_page.dart';
import 'package:flutter_gofast/src/modules/profile/profile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds =>
      [Bind((i) => HomeController(repository: FakeApiRepository()))];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => HomePage(),
    ),
    ChildRoute(RoutersConst.login, child: (_, args) => LoginPage()),
    ChildRoute(RoutersConst.profile, child: (_, __) => ProfilePage()),
  ];
}
