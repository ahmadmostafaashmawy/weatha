import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/utilities/app_color.dart';
import 'package:weather/utilities/app_images.dart';

class HomeHeader extends StatelessWidget {
  final String iconPath;
  final Function onClick;

  HomeHeader({Key key, this.iconPath, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(240),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppImages.logoIcon, height: ScreenUtil().setHeight(110)),
          if (iconPath != null) buildTopBarIcon(),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 60.0, top: 20.0),
              child: buildImage(),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 20.0),
              child: buildImage(),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 20.0),
              child: buildImage(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage() => Image.asset(AppImages.cloudIcon, height: 60);

  Widget buildTopBarIcon() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, top: 16.0),
        child: IconButton(
          onPressed: onClick,
          icon: Image.asset(
            iconPath,
            height: 24,
            color: AppColor.Blue,
          ),
        ),
      ),
    );
  }
}
