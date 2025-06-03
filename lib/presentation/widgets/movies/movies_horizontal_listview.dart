import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback?
  loadNextPage; //esto es por si quisiera cargar las siguientes peliculas al llegar al final

  const MoviesHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          SizedBox(height: 10),
          _Encabezado(title: title, subtitle: subtitle),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final movie = movies[index];
                return _Slide(movie: movie);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Encabezado({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final styleTitle = Theme.of(context).textTheme.titleLarge;
    //final buttonStyle = Theme.of(context).colorScheme.primary;
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: styleTitle),
          Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
              style: ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subtitle!),
            ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Todo lo que hay dentro de este SizedBox es el contenido de la pelicula
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),
          const SizedBox(height: 3),
          //Titulo de la pelicula
          SizedBox(
            width: 150,
            height: 40,
            child: Text(movie.title, maxLines: 2, style: textStyle.titleSmall),
          ),

          //Rating
          Row(
            children: [
              const Icon(
                Icons.star_half_outlined,
                size: 15,
                color: Colors.amber,
              ),
              const SizedBox(width: 5),
              Text(
                '${movie.voteAverage}',
                style: textStyle.bodyMedium?.copyWith(
                  color: color.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 68),
              Text(
                HumanFormats.humanReadableNumber(movie.popularity),
                style: textStyle.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
