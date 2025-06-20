import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageDatasource {
  Future<bool> isMovieFavorite(int movieId);
  Future<void> toggleFavorite(Movie movie);
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}
