import 'package:flutter/material.dart';

ThemeData themeData()=>ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.amber,
  ).copyWith(secondary: Colors.amberAccent),
  textTheme: const TextTheme(
    headline6: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    headline5: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    button: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    subtitle1: TextStyle(fontSize: 18, color: Colors.green),
  ),
);