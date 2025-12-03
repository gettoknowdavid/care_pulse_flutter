import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppTheme {
  const AppTheme._();

  static ThemeData get dark => _raw(Brightness.dark);

  static ThemeData get light => _raw(Brightness.light);

  static ThemeData _raw(Brightness brightness) {
    final base = ThemeData(brightness: brightness);
    return base.copyWith(
      brightness: brightness,
      colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(base.textTheme),
    );
  }
}
