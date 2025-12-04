import 'package:care_pulse_flutter/_routing/router.dart';
import 'package:care_pulse_flutter/_shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CarePulseApp extends StatelessWidget {
  const CarePulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = routerConfig();

    return ResponsiveBreakpoints.builder(
      useShortestSide: true,
      breakpoints: const [
        Breakpoint(start: 0, end: 450, name: PHONE),
        Breakpoint(start: 451, end: 600, name: MOBILE),
        Breakpoint(start: 601, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
      ],
      child: Builder(
        builder: (context) {
          var designSize = const Size(375, 812);

          if (ResponsiveBreakpoints.of(context).largerThan(TABLET)) {
            designSize = const Size(1440, 1024);
          }

          return ScreenUtilInit(
            designSize: designSize,
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) => ShadApp.router(
              routerConfig: router,
              title: 'CarePulse',
              themeMode: ThemeMode.dark,
              theme: AppTheme.theme,
            ),
          );
        },
      ),
    );
  }
}
