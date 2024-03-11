import 'package:flutter/material.dart';
import 'package:hr/presentation/resources/assets_manager.dart';
import 'package:hr/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ImageBackground extends StatelessWidget {
  const ImageBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: AppSize.s8.h,
      child: Image.asset(
        ImageAssets.startScreen,
        alignment: Alignment.topCenter,
        fit: BoxFit.fitHeight,
        height: AppSize.s8.h,
        //width: 13.w,
      ),
    );
  }
}
