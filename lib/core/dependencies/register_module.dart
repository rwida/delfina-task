import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../common/app_logger.dart';
import '../common/env_variables.dart';

/// this class register the third party plugins
@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named("BaseUrl")
  String get baseUrl => EnvVariables.instance().apiBaseUrl;

  // url here will be injected
  @Named('Dio')
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

  @Named('Interceptor')
  @lazySingleton
  Dio dioInterceptor(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

  @lazySingleton
  AppLogger appLogger() => AppLogger.init(false);

  // @preResolve
  // @singleton
  // Future<Box<dynamic>> box() async => Hive.openBox<dynamic>('AppBox');
  // // same thing works for instances that's gotten asynchronous.
  // // all you need to do is wrap your instance with a future and tell injectable how
  // // to initialize it
  // @preResolve // if you need to pre resolve the value
  // Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  // // Also, make sure you await for your configure function before running the App.
}
