import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cinemate/core/di/service_locaor.config.dart';
import 'package:cinemate/core/networking/dio_factory.dart';
import 'package:cinemate/core/networking/tmdb_dio_factory.dart';
import 'package:cinemate/core/utils/local_storage.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => await getIt.init();

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Dio dio(LocalStorage localStorage) => DioFactory.getDio(localStorage);

  @Named('tmdb')
  @lazySingleton
  Dio tmdbDio() => TmdbDioFactory.create();
}
