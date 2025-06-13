import 'package:cinemapedia/presentation/screens/movies/home_screen.dart';
import 'package:cinemapedia/presentation/screens/movies/movie_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final page = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageIndex: page);
      },
      routes: [
        //Con esto declaro la ruta como hija para que me pueda el botón atras regresar al home
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),

    GoRoute(path: '/', redirect: (_, _) => '/home/0'),
  ],
);
