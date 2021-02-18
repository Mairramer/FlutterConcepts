import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

// ignore: public_member_api_docs
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App de teste"),
          actions: [
            IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  Modular.get<AppController>().setThemeData(ThemeMode.light);
                }),
            IconButton(
                icon: Icon(Icons.theaters_outlined),
                onPressed: () {
                  Modular.get<AppController>().setThemeData(ThemeMode.dark);
                })
          ],
        ),
        body: AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) {
              return controller.stateManage(controller.state.value);
            }));
  }
}
