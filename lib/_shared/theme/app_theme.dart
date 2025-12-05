import 'package:care_pulse_flutter/_shared/ui/assets/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AppTheme {
  const AppTheme._();

  static ShadThemeData get theme {
    final textTheme = ShadTextTheme.fromGoogleFont(GoogleFonts.plusJakartaSans);
    return ShadThemeData(
      brightness: Brightness.dark,
      colorScheme: const ShadSlateColorScheme.dark(
        background: ColorName.dark300,
        foreground: Colors.white,
        custom: {
          'blue500': ColorName.blue500,
          'blue600': ColorName.blue600,
          'green500': ColorName.green500,
          'green600': ColorName.green600,
          'light200': ColorName.light200,
          'red500': ColorName.red500,
          'red600': ColorName.red600,
          'red700': ColorName.red700,
          'dark200': ColorName.dark200,
          'dark300': ColorName.dark300,
          'dark400': ColorName.dark400,
          'dark500': ColorName.dark500,
          'dark600': ColorName.dark600,
          'dark700': ColorName.dark700,
        },
      ),
      inputTheme: ShadInputTheme(
        padding: const EdgeInsets.all(12).r,
        decoration: ShadDecoration(
          color: ColorName.dark400,
          border: ShadBorder.all(color: ColorName.dark500),
        ),
      ),
      textTheme: textTheme,
      destructiveToastTheme: ShadToastTheme(alignment: Alignment.topRight),
    );
  }
}

extension CustomColorExtension on ShadColorScheme {
  Color get blue500 => custom['blue500']!;

  Color get blue600 => custom['blue600']!;

  Color get green500 => custom['green500']!;

  Color get green600 => custom['green600']!;

  Color get light200 => custom['light200']!;

  Color get red500 => custom['red500']!;

  Color get red600 => custom['red600']!;

  Color get red700 => custom['red700']!;

  Color get dark200 => custom['dark200']!;

  Color get dark300 => custom['dark300']!;

  Color get dark400 => custom['dark400']!;

  Color get dark500 => custom['dark500']!;

  Color get dark600 => custom['dark600']!;

  Color get dark700 => custom['dark700']!;
}
