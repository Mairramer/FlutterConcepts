import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/consts/assets_const.dart';
import 'package:flutter_gofast/src/core/consts/colors_const.dart';
import 'package:flutter_gofast/src/core/consts/routers_const.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

// ignore: public_member_api_docs
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: RoutersConst.intro,
        title: new Text('Welcome In SplashScreen'),
        image: new Image.asset(AssetsConsts.splash),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: ColorsConst.primaryColor);
  }
}
