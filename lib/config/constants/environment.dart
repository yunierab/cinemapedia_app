import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final String THE_MOVIE_DB_API_KEY =
      dotenv.env['THE_MOVIE_DB_KEY'] ?? 'No hay API Key';
}
