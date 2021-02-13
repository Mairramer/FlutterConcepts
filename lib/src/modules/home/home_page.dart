import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: public_member_api_docs
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App de teste"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                  child: Text("Tema light"),
                  onPressed: () {
                    Modular.get<AppController>().setThemeData(ThemeMode.light);
                  }),
              RaisedButton(
                  child: Text("Tema dark"),
                  onPressed: () {
                    Modular.get<AppController>().setThemeData(ThemeMode.dark);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
