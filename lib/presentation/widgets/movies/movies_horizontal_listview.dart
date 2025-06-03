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
      height: 350,
      child: Column(
        children: [
          SizedBox(height: 10),
          _Encabezado(title: title, subtitle: subtitle),
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
