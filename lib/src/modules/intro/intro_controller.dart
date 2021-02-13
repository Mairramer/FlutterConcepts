import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gofast/src/core/consts/routers_const.dart';

class IntroController {
  void doEnter() {
    Modular.to.pushReplacementNamed(RoutersConst.login);
  }
}
