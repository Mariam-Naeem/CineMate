import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/tmdb_constants.dart';
import '../models/movie.dart';

@lazySingleton
class TmdbMovieRepo {
  TmdbMovieRepo(@Named('tmdb') this._dio);

  final Dio _dio;

  Future<List<Movie>> getPopular() => _getMovies(TmdbConstants.popular);

  Future<List<Movie>> getTopRated() => _getMovies(TmdbConstants.topRated);

  Future<List<Movie>> getTrending() => _getMovies(TmdbConstants.trendingMovies);

  Future<List<Movie>> getNowPlaying() => _getMovies(TmdbConstants.nowPlaying);

  Future<List<Movie>> _getMovies(String path) async {
    final response = await _dio.get(
      path,
      queryParameters: {'language': 'en-US', 'page': 1},
    );
    final data = response.data;
    if (data is! Map<String, dynamic> || data['results'] is! List) {
      throw const FormatException('Invalid TMDB response.');
    }

    return (data['results'] as List)
        .whereType<Map<String, dynamic>>()
        .map(Movie.fromJson)
        .where((movie) => movie.title.isNotEmpty)
        .toList();
  }
}
