import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/theme/cinemate_theme.dart';
import '../../data/repo/tmdb_movie_repo.dart';
import '../viewmodels/home_view_model.dart';
import '../widgets/empty_tab.dart';
import '../widgets/featured_movie_card.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/home_header.dart';
import '../widgets/home_search_field.dart';
import '../widgets/movie_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(GetIt.instance<TmdbMovieRepo>());
    _viewModel.loadMovies();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: CinemateColors.background,
          body: SafeArea(
            bottom: false,
            child: IndexedStack(
              index: _viewModel.selectedTab,
              children: [
                _HomeContent(viewModel: _viewModel),
                const EmptyTab(icon: Icons.search, title: 'Search'),
                const EmptyTab(icon: Icons.bookmark_border, title: 'Watchlist'),
                const EmptyTab(icon: Icons.person_outline, title: 'Profile'),
              ],
            ),
          ),
          bottomNavigationBar: HomeBottomNav(
            selectedIndex: _viewModel.selectedTab,
            onSelected: _viewModel.selectTab,
          ),
        );
      },
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
          sliver: SliverToBoxAdapter(child: HomeHeader()),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          sliver: SliverToBoxAdapter(
            child: HomeSearchField(onChanged: viewModel.updateSearchQuery),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
          sliver: SliverToBoxAdapter(
            child: FeaturedMovieCard(movie: viewModel.featuredMovie),
          ),
        ),
        if (viewModel.isLoading)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 24),
              child: Center(
                child: CircularProgressIndicator(color: CinemateColors.accent),
              ),
            ),
          ),
        if (viewModel.errorMessage != null)
          SliverToBoxAdapter(
            child: _HomeError(
              message: viewModel.errorMessage!,
              onRetry: viewModel.loadMovies,
            ),
          ),
        MovieSection(title: 'Trending Now', movies: viewModel.trendingMovies),
        MovieSection(title: 'Popular', movies: viewModel.popularMovies),
        MovieSection(title: 'Top Rated', movies: viewModel.topRatedMovies),
        MovieSection(title: 'Now Playing', movies: viewModel.nowPlayingMovies),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

class _HomeError extends StatelessWidget {
  const _HomeError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: CinemateColors.muted, fontSize: 11),
            ),
          ),
          TextButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
