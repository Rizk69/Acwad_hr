import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr/app/app_prefs.dart';
import 'package:hr/app/di.dart';
import 'package:hr/presentation/resources/assets_manager.dart';
import 'package:hr/presentation/resources/routes_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    _appPreferences.isUserLoggedIn().then((isUserLogin) => {
          if (isUserLogin)
            {Navigator.pushReplacementNamed(context, Routes.homeRoute)}
          else
            {Navigator.pushReplacementNamed(context, Routes.loginRoute)}
        });
  }

  @override
  void initState() {
    super.initState();

    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.startScreen),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 50.w,
              height: 50.h,
              alignment: Alignment.center,
              child: SvgPicture.asset(IconAssets.icon),
            ),
          ),
        ]),
      ),
    );
  }
}
