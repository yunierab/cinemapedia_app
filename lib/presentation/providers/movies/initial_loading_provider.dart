import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final nowPlayingProvider = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final moviesSlideProvider = ref.watch(moviesSlideShowProvider).isEmpty;
  final popularProvider = ref.watch(popularMoviesProvider).isEmpty;
  final upcomingProvider = ref.watch(upcomingMoviesProvider).isEmpty;
  final topRatedProvider = ref.watch(topRatedMoviesProvider).isEmpty;

  return (nowPlayingProvider ||
          moviesSlideProvider ||
          popularProvider ||
          upcomingProvider ||
          topRatedProvider)
      ? true
      : false;
});
