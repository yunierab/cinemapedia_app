import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db; //Para la BD Isar

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema, ActorSchema],
        inspector: true,
        directory:
            '/storage/emulated/0/Android/data/com.example.cinemapedia/files',
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;
    final movie = await isar.movies.filter().idEqualTo(movieId).findFirst();
    return movie != null;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;
    //Busco si el movie ya esta en la BD
    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();

    //Si el movie ya esta en la BD lo borro
    if (favoriteMovie != null) {
      await isar.writeTxn(() async {
        await isar.movies.delete(favoriteMovie.idIsar!);
      });
      return;
    } else {
      //Si el movie no esta en la BD lo agrego
      await isar.writeTxn(() async {
        await isar.movies.put(movie);
      });
    }
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.movies.where().offset(offset).limit(limit).findAll();
  }
}
