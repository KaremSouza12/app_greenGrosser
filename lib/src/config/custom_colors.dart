import 'package:flutter/material.dart';

Map<int, Color> _swatchOpcity = {
  50: const Color.fromARGB(139, 195, 74, 1),
  100: const Color.fromARGB(139, 195, 74, 2),
  200: const Color.fromARGB(139, 195, 74, 3),
  300: const Color.fromARGB(139, 195, 74, 4),
  400: const Color.fromARGB(139, 195, 74, 5),
  500: const Color.fromARGB(139, 195, 74, 6),
  600: const Color.fromARGB(139, 195, 74, 7),
  700: const Color.fromARGB(139, 195, 74, 8),
  800: const Color.fromARGB(139, 195, 74, 9),
  900: const Color.fromARGB(139, 195, 74, 1),
};

abstract class CustomColors {
  static Color contratstColors = Colors.red.shade700;

  static MaterialColor customSwatchColor = MaterialColor(
    0xFF8bc34a,
    _swatchOpcity,
  );
}
