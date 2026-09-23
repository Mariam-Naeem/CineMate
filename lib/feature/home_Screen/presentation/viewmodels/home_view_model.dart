import 'package:flutter/foundation.dart';

import '../../data/models/movie.dart';
import '../../data/repo/tmdb_movie_repo.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._movieRepo);

  final TmdbMovieRepo _movieRepo;

  int _selectedTab = 0;
  String _searchQuery = '';
  bool _isLoading = false;
  bool _disposed = false;
  String? _errorMessage;
  List<Movie> _trendingMovies = const [];
  List<Movie> _popularMovies = const [];
  List<Movie> _topRatedMovies = const [];
  List<Movie> _nowPlayingMovies = const [];

  int get selectedTab => _selectedTab;
  String get searchQuery => _searchQuery;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Movie get featuredMovie => _featuredMovie;
  List<Movie> get trendingMovies => _trendingMovies;
  List<Movie> get popularMovies => _popularMovies;
  List<Movie> get topRatedMovies => _topRatedMovies;
  List<Movie> get nowPlayingMovies => _nowPlayingMovies;

  Future<void> loadMovies() async {
    if (_disposed) return;
    _isLoading = true;
    _errorMessage = null;
    _notifyListenersIfActive();
    try {
      final results = await Future.wait([
        _movieRepo.getTrending(),
        _movieRepo.getPopular(),
        _movieRepo.getTopRated(),
        _movieRepo.getNowPlaying(),
      ]);
      if (_disposed) return;
      _trendingMovies = results[0];
      _popularMovies = results[1];
      _topRatedMovies = results[2];
      _nowPlayingMovies = results[3];
    } catch (_) {
      if (_disposed) return;
      _errorMessage =
          'Unable to load movies. Check your connection and try again.';
    } finally {
      if (!_disposed) {
        _isLoading = false;
        _notifyListenersIfActive();
      }
    }
  }

  void selectTab(int index) {
    if (_disposed) return;
    if (_selectedTab == index) return;
    _selectedTab = index;
    _notifyListenersIfActive();
  }

  void updateSearchQuery(String query) {
    if (_disposed) return;
    _searchQuery = query;
    _notifyListenersIfActive();
  }

  void _notifyListenersIfActive() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  static const _featuredMovie = Movie(
    title: 'Dune: Part Two',
    year: '2024',
    rating: '8.6',
    duration: '2h 46m',
    imageUrl: 'https://image.tmdb.org/t/p/w780/1pdfLvKBd6VZ6mIlf8tK3N5yJ1k.jpg',
  );
}
