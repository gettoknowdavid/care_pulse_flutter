import 'package:flutter/material.dart';

final class AppColors {
  const AppColors._();

  static const MaterialColor green = MaterialColor(0xFF24AE7C, <int, Color>{
    500: Color(0xFF24AE7C),
    600: Color(0xFF0D2A1F),
  });

  static const MaterialColor blue = MaterialColor(0xFF79B5EC, <int, Color>{
    500: Color(0xFF79B5EC),
    600: Color(0xFF152432),
  });

  static const MaterialColor red = MaterialColor(0xFFF37877, <int, Color>{
    500: Color(0xFFF37877),
    600: Color(0xFF3E1716),
    700: Color(0xFFF24E43),
  });

  static const MaterialColor light = MaterialColor(0xFFE8E9E9, <int, Color>{
    200: Color(0xFFE8E9E9),
  });

  static const MaterialColor dark = MaterialColor(0xFF0D0F10, <int, Color>{
    200: Color(0xFF0D0F10),
    300: Color(0xFF131619),
    400: Color(0xFF1A1D21),
    500: Color(0xFF363A3D),
    600: Color(0xFF76828D),
    700: Color(0xFFABB8C4),
  });
}
