import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hr/app/app.dart';
import 'package:hr/app/di.dart';
import 'package:hr/data/network/bloc_observer.dart';
import 'package:hr/presentation/resources/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  /// transparent status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
  );
  await initAppModule();
  runApp(
    EasyLocalization(
      supportedLocales: const [ ENGLISH_LOCAL],
      path: ASSTET_PATH_LOCALISATION,
      child: Phoenix(child: MyApp()),
    ),
  );
}
