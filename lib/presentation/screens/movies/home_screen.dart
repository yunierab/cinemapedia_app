import 'package:cinemapedia/presentation/views/movies/favorites_view.dart';
import 'package:cinemapedia/presentation/views/movies/home_view.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home-screen';
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(), //Aqui iria CategoriaView
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //List<Movie> movies = nowPlayingProvider;
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ), //Este widget mantiene el estado
      bottomNavigationBar: CustomBottomNavigationbar(currentIndex: pageIndex),
    );
  }
}
