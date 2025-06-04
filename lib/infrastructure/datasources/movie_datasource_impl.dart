import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasourceImpl extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': Environment.THE_MOVIE_DB_API_KEY,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      'movie/now_playing',
      queryParameters: {'page': page},
    );
    final List<Movie> movieList =
        MovieDbResponse.fromJson(response.data).results
            .where(
              (moviDb) => moviDb.posterPath != "No poster",
            ) //Con esto solo mostrare las peliculas que tengan un posterPath
            .map((e) => MovieMapper.movieDbToEntity(e))
            .toList();

    return movieList;
  }
}
