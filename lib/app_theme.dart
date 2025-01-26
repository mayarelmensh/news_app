import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData LightTheme = ThemeData(
      indicatorColor: Colors.black,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          labelLarge: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          labelMedium: TextStyle(fontSize: 14, color: Colors.black),
          headlineLarge: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)));

  static final ThemeData darkTheme = ThemeData(
      indicatorColor: Colors.white,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          labelLarge: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          labelMedium: TextStyle(fontSize: 14, color: Colors.white),
          headlineLarge: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)));
}
