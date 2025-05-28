import 'package:cinemapedia/infrastructure/datasources/movie_datasource_impl.dart';
import 'package:cinemapedia/infrastructure/repositories/movies_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este provider me permite acceder a la instancia de mi repositorio y es de solo lectura
final moviesRepositoryProvider = Provider((ref) {
  return MoviedbRepositoryImpl(MoviedbDatasourceImpl());
});
