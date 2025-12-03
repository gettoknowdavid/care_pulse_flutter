import 'package:care_pulse_flutter/_features/home/widgets/home_page.dart';
import 'package:care_pulse_flutter/_routing/router.dart';
import 'package:care_pulse_flutter/_shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CarePulseApp extends StatelessWidget {
  const CarePulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = routerConfig();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      title: 'CarePulse',
      themeMode: ThemeMode.dark,
    );
  }
}
