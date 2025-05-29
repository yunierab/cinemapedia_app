import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //List<Movie> movies = nowPlayingProvider;
    return Scaffold(
      //appBar: AppBar(title: const Text('Cinemapedia')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingProvider = ref.watch(nowPlayingMoviesProvider);
    return ListView.builder(
      itemCount: nowPlayingProvider.length,
      itemBuilder: (context, index) {
        final movie = nowPlayingProvider[index];
        return ListTile(title: Text(movie.title));
      },
    );
  }
}
