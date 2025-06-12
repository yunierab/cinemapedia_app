import 'package:cinemapedia/presentation/widgets/shared/custom_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home-screen';
  final Widget childView;
  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //List<Movie> movies = nowPlayingProvider;
    return Scaffold(
      //appBar: AppBar(title: const Text('Cinemapedia')),
      body: childView,
      bottomNavigationBar: const CustomBottomNavigationbar(),
    );
  }
}
