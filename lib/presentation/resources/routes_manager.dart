import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr/app/di.dart';
import 'package:hr/presentation/login/view/login_view.dart';
import 'package:hr/generated/locale_keys.g.dart';
import 'package:hr/presentation/splash/presentation/view/splash_view.dart';

import '../home/presentation/home.dart';


class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String startRoute = "/start";
  static const String homeRoute = "/home";
  static const String profileRoute = "/profile";
  static const String onBoardingRoute = "/onBoarding";
  static const String confirmSignUpRoute = "/confirmSignUpRoute";
  static const String verificationEmail = "/verificationEmail";
  static const String submitCodeView = '/submitCodeView';
  static const String resetPassword = '/resetPassword';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) =>  LoginView());
        case Routes.homeRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) =>  HomeController());



      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(LocaleKeys.noRouteFound.tr()),
              ),
              body: Center(child: Text(LocaleKeys.noRouteFound.tr())),
            ));
  }
}
