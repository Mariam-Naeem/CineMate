import 'package:dio/dio.dart';

import 'tmdb_constants.dart';

class TmdbDioFactory {
  static Dio create() {
    const token = String.fromEnvironment('TMDB_ACCESS_TOKEN');
    return Dio(
      BaseOptions(
        baseUrl: TmdbConstants.baseUrl,
        headers: {
          'Accept': 'application/json',
          if (token.isNotEmpty) 'Authorization': 'Bearer $token',
        },
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
  }
}
