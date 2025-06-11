import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  //Se sobreescribe el metodo searchFieldLabel de la clase SearchDelegate para cambiar el texto de la busqueda
  @override
  String? get searchFieldLabel => "Buscar película";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        FadeIn(
          duration: Duration(microseconds: 200),
          child: IconButton(
            onPressed: () {
              query =
                  ""; //query es una variable que se utiliza para almacenar el texto de la busqueda y me la ofrece la clase SearchDelegate
            },
            icon: Icon(Icons.clear),
          ),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(
          context,
          null,
        ); //Esta funcion esta predefinida para cerrar la busqueda e ir hacia atras
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("BuildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("BuildSuggestions");
  }
}
