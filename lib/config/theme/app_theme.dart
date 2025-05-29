import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ), //esto controla todos los appBar de mi aplicacion
    );
  }
}
