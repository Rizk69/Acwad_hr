import 'dart:async';
import 'package:flutter/material.dart';
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
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat(reverse: false);
  late final Animation<Offset> _offesttopAnimation = Tween<Offset>(
          begin: Offset(-0.3, 0), end: Offset(-0.1, 0))
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  late final Animation<Offset> _offestAnimation = Tween<Offset>(
          begin: Offset.zero, end: Offset(0, 0.2))
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  late final Animation<Offset> _offestdownAnimation = Tween<Offset>(
          begin: Offset(0.3, 0), end: Offset(0.1, 0))
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

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
    _controller.dispose();

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
            alignment: Alignment.topLeft,
            child: SlideTransition(
              position: _offesttopAnimation,
              child: Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/pattern top.png',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SlideTransition(
              position: _offestAnimation,
              child: Container(
                width: 50.w,
                height: 50.h,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo_omran-removebg-preview 1.png',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SlideTransition(
              position: _offestdownAnimation,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/pattern down.png',
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
