import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather/utilities/app_color.dart';
import 'package:weather/utilities/app_images.dart';
import 'package:weather/utilities/localization/localization_constains.dart';
import 'package:weather/utilities/navigator.dart';
import 'package:weather/view/components_widgets/size.dart';

import '../routes.dart';
import 'components_widgets/text_display.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      popAndPushName(context, AppRoute.homeScreen);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logoIcon, height: ScreenUtil().setHeight(60)),
            WidthBox(16),
            AppTextDisplay(
              translation: kAppName,
              color: AppColor.PrimaryColor,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
