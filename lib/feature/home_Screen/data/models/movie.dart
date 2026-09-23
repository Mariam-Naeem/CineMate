import '../../../../core/networking/tmdb_constants.dart';

class Movie {
  const Movie({
    required this.title,
    required this.year,
    required this.rating,
    required this.imageUrl,
    this.duration,
  });

  final String title;
  final String year;
  final String rating;
  final String imageUrl;
  final String? duration;

  factory Movie.fromJson(Map<String, dynamic> json) {
    final posterPath = json['poster_path'] as String?;
    final releaseDate = json['release_date'] as String? ?? '';
    final voteAverage = (json['vote_average'] as num?)?.toDouble() ?? 0;

    return Movie(
      title: json['title'] as String? ?? '',
      year: releaseDate.length >= 4 ? releaseDate.substring(0, 4) : 'N/A',
      rating: voteAverage.toStringAsFixed(1),
      imageUrl: posterPath == null
          ? ''
          : '${TmdbConstants.imageBaseUrl}$posterPath',
    );
  }
}
