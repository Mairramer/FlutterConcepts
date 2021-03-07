import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/auth/auth_controller.dart';
import 'package:flutter_gofast/src/core/features/internationalization/app_translator.dart';
import 'package:flutter_gofast/src/widgets/scroll_widget.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  late AuthController _authController;

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ScrollWidget(
        children: <Widget>[
          TextField(
            onChanged: _authController.setEmail,
            decoration: InputDecoration(hintText: "Seu email"),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          TextField(
            onChanged: _authController.setPassword,
            decoration: InputDecoration(hintText: "Sua senha"),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: _height * 0.06,
          ),
          Observer(
              name: 'LoginButton',
              builder: (context) {
                return ElevatedButton(
                  onPressed: _authController.enableButton
                      ? () async {
                          await _authController.doLoginEmail().catchError(
                            (error) {
                              var snackbar = SnackBar(
                                content: Text(error.message),
                              );
                              // ignore: deprecated_member_use
                              Scaffold.of(context).showSnackBar(snackbar);
                            },
                          );
                        }
                      : null,
                  child: Text(
                    AppTranslator(context).text('intro.login_now', params: {}),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                );
              }),
          SizedBox(
            height: _height * 0.06,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
            onPressed: _authController.doLoginGoogle,
            child: Text(
              AppTranslator(context).text('intro.login_google', params: {}),
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: _height * 0.06,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
            // ignore: deprecated_member_use
            onPressed: controller.doRegister,
            child: Text(
              "REGISTRAR-SE",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
