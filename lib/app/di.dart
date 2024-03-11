import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:hr/app/app_prefs.dart';
import 'package:hr/data/data_source/remote_data_source.dart';
import 'package:hr/data/network/app_api.dart';
import 'package:hr/data/network/dio_factory.dart';
import 'package:hr/data/network/network_info.dart';
import 'package:hr/data/repository/repository_impl.dart';
import 'package:hr/domain/repository/repository.dart';
import 'package:hr/domain/usecase/login_usecase.dart';
import 'package:hr/presentation/login/manger/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  //shared prefs instance
  var sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  }
}




resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
}
