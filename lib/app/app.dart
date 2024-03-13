import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/app/app_prefs.dart';
import 'package:hr/app/di.dart';
import 'package:hr/presentation/login/manger/login_cubit.dart';
import 'package:hr/presentation/resources/routes_manager.dart';
import 'package:hr/presentation/resources/theme_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor
  int appState = 0;
  static final MyApp instance =
      MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => context.setLocale(local));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (_) => instance<LoginCubit>()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowMaterialGrid: false,
            builder: (context, child) {
              return ResponsiveWrapper.builder(
                ClampingScrollWrapper.builder(context, child!),
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(450, name: MOBILE),
                  const ResponsiveBreakpoint.resize(800, name: TABLET),
                  const ResponsiveBreakpoint.resize(1000, name: TABLET),
                  const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  const ResponsiveBreakpoint.resize(2460, name: '4K'),
                ],
                breakpointsLandscape: [
                  const ResponsiveBreakpoint.resize(560, name: MOBILE),
                  const ResponsiveBreakpoint.resize(812, name: TABLET),
                  const ResponsiveBreakpoint.resize(1024, name: TABLET),
                  const ResponsiveBreakpoint.resize(1120, name: DESKTOP),
                  const ResponsiveBreakpoint.resize(2460, name: '4K'),
                ],
              );
            },
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashRoute,
            theme: getApplicationTheme(),
          );
        },
      ),
    );
  }
}
