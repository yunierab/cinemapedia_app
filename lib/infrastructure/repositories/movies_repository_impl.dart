import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movie_repository.dart';

class MoviedbRepositoryImpl extends MovieRepository {
  final MoviesDatasource moviesDatasource;

  MoviedbRepositoryImpl(this.moviesDatasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDatasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return moviesDatasource.getPopular(page: page);
  }

  Future<List<Movie>> getUpcoming({int page = 1}) {
    return moviesDatasource.getUpcoming(page: page);
  }

  Future<List<Movie>> getTopRated({int page = 1}) {
    return moviesDatasource.getTopRated(page: page);
  }
}
