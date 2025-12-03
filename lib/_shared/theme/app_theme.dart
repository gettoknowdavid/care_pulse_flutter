import 'package:care_pulse_flutter/_shared/theme/app_colors.dart';
import 'package:care_pulse_flutter/_shared/utils/system_internal.dart';
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
      cardColor: SI.resolve(brightness, null, AppColors.dark.shade400),
      colorScheme: base.colorScheme.copyWith(
        brightness: brightness,
        surface: SI.resolve(brightness, null, AppColors.dark.shade400),
        onSurface: SI.resolve(brightness, null, Colors.white),
      ),
      scaffoldBackgroundColor: SI.resolve(
        brightness,
        null,
        AppColors.dark.shade300,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(base.textTheme),
    );
  }
}
