import 'package:cinemapedia/presentation/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_slideshow.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_appbar.dart';
import 'package:cinemapedia/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingProvider = ref.watch(nowPlayingMoviesProvider);
    final moviesSlideProvider = ref.watch(moviesSlideShowProvider);
    final popularProvider = ref.watch(popularMoviesProvider);
    final upcomingProvider = ref.watch(upcomingMoviesProvider);
    final topRatedProvider = ref.watch(topRatedMoviesProvider);
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) {
      return const FullScreenLoader();
    }
    return CustomScrollView(
      //Esto se usa para poder crear un AppBar que se haga visible en cuanto hacemos scroll hacia arriba
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.white,
          flexibleSpace: CustomAppbar(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlideShow(movies: moviesSlideProvider),
                MoviesHorizontalListview(
                  movies: nowPlayingProvider,
                  title: "En cines",
                  subtitle: "Lunes 20",
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MoviesHorizontalListview(
                  movies: upcomingProvider,
                  title: "Proximamente",
                  subtitle: "En este mes",
                  loadNextPage: () {
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MoviesHorizontalListview(
                  movies: popularProvider,
                  title: "Populares",
                  //subtitle: "En este mes",
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MoviesHorizontalListview(
                  movies: topRatedProvider,
                  title: "Mejor calificadas",
                  subtitle: "Desde siempre",
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  },
                ),

                SizedBox(height: 10),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
