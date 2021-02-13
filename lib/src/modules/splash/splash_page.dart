import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/consts/assets_const.dart';
import 'package:flutter_gofast/src/core/consts/routers_const.dart';
import 'package:splashscreen/splashscreen.dart';

// ignore: public_member_api_docs
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          backgroundColor: Colors.white,
          navigateAfterSeconds: RoutersConst.intro,
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AssetsConsts.splash,
                ),
                fit: BoxFit.scaleDown,
                scale: 1.5),
          ),
        ),
      ],
    );
  }
}
