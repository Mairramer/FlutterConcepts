import 'package:flutter_gofast/src/modules/intro/intro_controller.dart';
import 'package:flutter_gofast/src/modules/intro/intro_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IntroModule extends Module {
  @override
  List<Bind> get binds => [Bind((i) => IntroController())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => IntroPage())
  ];
}
