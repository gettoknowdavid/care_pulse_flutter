import 'package:care_pulse_flutter/_features/home_page.dart';
import 'package:care_pulse_flutter/_shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CarePulseApp extends StatelessWidget {
  const CarePulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      title: 'CarePulse',
    );
  }
}
