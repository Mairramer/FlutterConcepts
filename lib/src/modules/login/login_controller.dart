import 'package:flutter_gofast/src/core/consts/routers_const.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginController {
  void doRegister() {
    Modular.to.pushNamed(RoutersConst.register);
  }
}
