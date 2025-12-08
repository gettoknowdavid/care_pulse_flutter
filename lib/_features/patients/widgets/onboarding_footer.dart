import 'package:care_pulse_flutter/_shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          '© ${DateTime.now().year} CarePulse',
          style: textTheme.small.copyWith(color: colors.dark600),
        ),
        ShadButton.link(
          onPressed: () {},
          padding: .zero,
          textStyle: textTheme.small,
          foregroundColor: colors.green500,
          child: const Text('Admin'),
        ),
      ],
    );
  }
}
