import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 183, 152, 236),
    ),
    useMaterial3: true,
  );
}
