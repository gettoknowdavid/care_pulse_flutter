import 'package:care_pulse_flutter/_features/patients/patients.dart';
import 'package:care_pulse_flutter/_routing/routes.dart';
import 'package:care_pulse_flutter/_shared/theme/app_theme.dart';
import 'package:care_pulse_flutter/_shared/ui/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PatientRegisterPage extends WatchingStatefulWidget {
  const PatientRegisterPage({super.key});

  @override
  State<PatientRegisterPage> createState() => _PatientRegisterPageState();
}

class _PatientRegisterPageState extends State<PatientRegisterPage> {
  @override
  Widget build(BuildContext context) {
    registerHandler(
      select: (PatientsManagerRemote m) => m.logout,
      handler: (context, _, _) {
        context.go(R.onboarding);
      },
    );

    registerHandler(
      select: (PatientsManagerRemote m) => m.logout.errors,
      handler: (context, error, _) {
        if (error == null) return;
        ShadToaster.of(context).show(
          ShadToast.destructive(
            title: const Text('An Error Occurred'),
            description: Text(error.error.toString()),
          ),
        );
      },
    );

    final colors = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;

    final isLarge = ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);

    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  padding: !isLarge ? const EdgeInsets.all(16).r : null,
                  constraints: const BoxConstraints.expand(width: 860).r,
                  child: SingleChildScrollView(
                    padding: isLarge
                        ? const EdgeInsets.symmetric(vertical: 40).r
                        : null,
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .center,
                      children: [
                        Assets.images.logoFull.svg(),
                        48.verticalSpace,
                        Text('Welcome 👋', style: textTheme.h2),
                        Text(
                          'We would like to know more about you.',
                          style: textTheme.p.copyWith(color: colors.dark700),
                        ),
                        48.verticalSpace,
                        const PatientRegistrationForm(),
                        64.verticalSpace,
                        const OnboardingFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ResponsiveVisibility(
              visible: isLarge,
              child: SizedBox(
                height: double.infinity,
                width: 390.w,
                child: Assets.images.registerImg.image(fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
