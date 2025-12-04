import 'package:care_pulse_flutter/_shared/theme/app_theme.dart';
import 'package:care_pulse_flutter/_shared/ui/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    this.leading,
    this.trailing,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.size = ShadButtonSize.lg,
    super.key,
  });

  final String label;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;
  final bool enabled;
  final ShadButtonSize size;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;
    return ShadButton(
      leading: leading,
      trailing: trailing,
      backgroundColor: colors.green500,
      foregroundColor: Colors.white,
      hoverBackgroundColor: colors.green500.withValues(alpha: 0.8),
      hoverForegroundColor: Colors.white60,
      enabled: enabled,
      onPressed: onPressed,
      size: size,
      child: isLoading ? const LoadingIndicator() : Text(label),
    );
  }
}
