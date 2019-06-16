import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(new MaterialApp(
  title: "BMI",
  home: Home(),
  theme: buildTheme(),
));

ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.red,
    primaryColor: Colors.pinkAccent,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.pink,
      ),
      labelStyle: TextStyle(
        color: Colors.pinkAccent,
      ),
    ),
  );
}