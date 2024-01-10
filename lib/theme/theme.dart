import 'package:flutter/material.dart';

ThemeData ligtMode = ThemeData(
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
  )
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Color.fromARGB(255, 39, 39, 39),
    tertiary: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade300,
  )
);