// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/home/data/repository/get_random_photos_repository_imp.dart'
    as _i7;
import '../../features/home/domain/repository/get_random_photos_repository.dart'
    as _i6;
import '../../features/home/domain/use_cases/get_random_photos_use_case.dart'
    as _i9;
import '../../features/home/presentation/bloc/get_random_photos_bloc.dart'
    as _i10;
import '../common/api_service.dart' as _i5;
import '../common/app_logger.dart' as _i3;
import '../common/index.dart' as _i8;
import 'register_module.dart' as _i11;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppLogger>(() => registerModule.appLogger());
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i4.Dio>(
    () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')),
    instanceName: 'Dio',
  );
  gh.lazySingleton<_i4.Dio>(
    () => registerModule.dioInterceptor(gh<String>(instanceName: 'BaseUrl')),
    instanceName: 'Interceptor',
  );
  gh.factory<_i5.ApiService>(
      () => _i5.ApiService(gh<_i4.Dio>(instanceName: 'Dio')));
  gh.factory<_i6.GetRandomPhotosRepository>(
      () => _i7.GetRandomPhotosRepositoryImp(gh<_i8.ApiService>()));
  gh.factory<_i9.GetRandomPhotosUseCase>(
      () => _i9.GetRandomPhotosUseCase(gh<_i6.GetRandomPhotosRepository>()));
  gh.factory<_i10.GetRandomPhotosBloc>(() => _i10.GetRandomPhotosBloc(
        gh<_i9.GetRandomPhotosUseCase>(),
        gh<_i3.AppLogger>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i11.RegisterModule {}
