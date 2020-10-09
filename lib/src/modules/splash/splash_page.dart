import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/app/app_controller.dart';
import 'package:flutter_gofast/src/core/interfaces/auth_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("Theme Dark"),
            onPressed: () {
              Modular.get<AppController>().setThemeData(ThemeMode.dark);
            },
          ),
          RaisedButton(
            child: Text("Theme Light"),
            onPressed: () {
              Modular.get<AppController>().setThemeData(ThemeMode.light);
            },
          ),
          RaisedButton(
              child: Text("Login"),
              onPressed: () async {
                await Modular.get<IAuthRepository>()
                    .doLoginGoogle()
                    .then((response) {
                  print(response.message);
                });
              })
        ],
      ),
    ));
  }
}
