import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/internationalization/app_translator.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Center(child: Text(AppTranslator(context).text('welcome'))));
  }
}
