import 'package:flutter/material.dart';

abstract class AppColors {
  static Map<int, Color> colorSwatch = {
    50: const Color.fromRGBO(2, 46, 117, .1),
    100: const Color.fromRGBO(2, 46, 117, .2),
    200: const Color.fromRGBO(2, 46, 117, .3),
    300: const Color.fromRGBO(2, 46, 117, .4),
    400: const Color.fromRGBO(2, 46, 117, .5),
    500: const Color.fromRGBO(2, 46, 117, .6),
    600: const Color.fromRGBO(2, 46, 117, .7),
    700: const Color.fromRGBO(2, 46, 117, .8),
    800: const Color.fromRGBO(2, 46, 117, .9),
    900: const Color.fromRGBO(2, 46, 117, 1),
  };

  static const Color primaryColor = Color(0xFF022E75);
  static const Color accentColor = Color.fromRGBO(255, 217, 0, 1);
}
