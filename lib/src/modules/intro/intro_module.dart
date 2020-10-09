import 'package:flutter_gofast/src/modules/intro/intro_controller.dart';
import 'package:flutter_gofast/src/modules/intro/intro_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IntroModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => IntroController())];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter('/login', child: (_, args) => IntroPage())];

  static Inject get to => Inject<IntroModule>.of();
}
