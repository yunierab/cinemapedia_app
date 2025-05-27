import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.deepPurpleAccent,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ), //esto controla todos los appBar de mi aplicacion
    );
  }
}
