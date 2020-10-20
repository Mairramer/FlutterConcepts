import 'package:flutter/material.dart';
import 'package:flutter_gofast/src/core/consts/assets_const.dart';
import 'package:flutter_gofast/src/core/features/internationalization/app_translator.dart';

import 'slide_page_widget.dart';

class SlideWidget extends StatelessWidget {
  final ValueChanged<int> onPageChanged;

  const SlideWidget({Key key, this.onPageChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: PageView(
          physics: BouncingScrollPhysics(),
          onPageChanged: onPageChanged,
          children: <Widget>[
            SlidePageWidget(
              text: AppTranslator(context).text('intro.step1'),
              asset: AssetsConsts.step1,
            ),
            SlidePageWidget(
              text: AppTranslator(context).text('intro.step2'),
              asset: AssetsConsts.step2,
            ),
            SlidePageWidget(
              text: AppTranslator(context).text('intro.step3'),
              asset: AssetsConsts.step3,
            ),
          ],
        ),
      ),
    );
  }
}
