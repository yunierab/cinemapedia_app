import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate {
  //Se sobreescribe el metodo searchFieldLabel de la clase SearchDelegate para cambiar el texto de la busqueda
  @override
  String? get searchFieldLabel => "Buscar pelicula";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Text("BuildActions")];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text("BuildLeading");
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
