import 'dart:async';
import 'dart:isolate';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_init.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  usesNullSafety: true,
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)

//Future<void> configureDependencies() => $initGetIt(getIt);
@InjectableInit(preferRelativeImports: false)
GetIt configureDependencies() {
  //ticket files
  getIt.registerLazySingleton<ReceivePort>(
    () => ReceivePort(),
  );
  getIt.registerLazySingleton<StreamController>(
    () {
      final stream = StreamController<dynamic>.broadcast();
      getIt<ReceivePort>().listen((message) => getIt<StreamController>().add(message));
      return stream;
    },
  );

  return $initGetIt(getIt);
}
