import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr/app/di.dart';
import 'package:hr/core/sucss_page.dart';
import 'package:hr/presentation/ProjectView/presentation/project_details_view.dart';
import 'package:hr/presentation/ProjectView/presentation/tasks_details_view.dart';
import 'package:hr/presentation/RequestsView/presentation/requests_details.dart';
import 'package:hr/presentation/home/presentation/widget/groups_details_view.dart';
import 'package:hr/presentation/login/view/login_view.dart';
import 'package:hr/generated/locale_keys.g.dart';
import 'package:hr/presentation/splash/presentation/view/splash_view.dart';

import '../home/presentation/home.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String startRoute = "/start";
  static const String homeRoute = "/home";
  static const String successfullyRoute = "/successfullyRoute";

  static const String groupDetailsRoute = "/groupDetailsRoute";
  static const String projectDetailsRoute = "/projectDetailsRoute";
  static const String requestsDetailsRoute = "/requestsDetailsRoute";
  static const String tasksDetailsRoute = "/tasksDetailsRoute";
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
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeController());
        case Routes.groupDetailsRoute:
        return MaterialPageRoute(builder: (_) => GroupsDetails());
        case Routes.projectDetailsRoute:
        return MaterialPageRoute(builder: (_) => ProjectDetails());
        case Routes.tasksDetailsRoute:
        return MaterialPageRoute(builder: (_) => TasksDetails());
        case Routes.requestsDetailsRoute:
        return MaterialPageRoute(builder: (_) => RequestsDetails());
        case Routes.successfullyRoute:
        return MaterialPageRoute(builder: (_) => SucssufflySceen(title:'Successfully added' , textbutton: 'Back To Teams', ));

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
