import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00189b), brightness: Brightness.light, primary: const Color(0xFF00189b)),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00189b), brightness: Brightness.dark, primary: const Color(0xFF00189b)),
);
