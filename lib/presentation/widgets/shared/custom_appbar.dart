import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/search/search_movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              SizedBox(width: 7),
              Text("Cinemapedia", style: titleStyle),
              Spacer(), //Con esto muevo lo de abajo hacia la parte mas a la derecha del Row
              IconButton(
                onPressed: () {
                  final searchedMovies = ref.read(searchedMoviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);
                  //Esta funcion la trae incorporada flutter para el trabajo con las busquedas
                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                      initialMovies: searchedMovies,
                      searchMovies:
                          ref
                              .read(searchedMoviesProvider.notifier)
                              .searchMoviesByQuery,
                    ),
                  ).then((movie) {
                    if (movie == null) return;

                    context.push('/movie/${movie.id}');
                  });
                },
                icon: Icon(Icons.search, color: colors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
