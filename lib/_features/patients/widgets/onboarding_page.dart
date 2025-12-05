import 'package:care_pulse_flutter/_features/patients/patients.dart';
import 'package:care_pulse_flutter/_features/patients/widgets/patient_get_started_form_widget.dart';
import 'package:care_pulse_flutter/_shared/theme/app_theme.dart';
import 'package:care_pulse_flutter/_shared/ui/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  padding: !isLarge
                      ? const EdgeInsets.symmetric(horizontal: 16).r
                      : null,
                  constraints: const BoxConstraints.expand(width: 496).r,
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .center,
                    children: [
                      Assets.images.logoFull.svg(),
                      48.verticalSpace,
                      Text('Hi there 👋', style: textTheme.h2),
                      Text(
                        'Get started with appointments.',
                        style: textTheme.p.copyWith(color: colors.dark700),
                      ),
                      48.verticalSpace,
                      ShadTabs(
                        value: 'get-started',
                        decoration: ShadDecoration(color: colors.dark400),
                        tabBarConstraints: const BoxConstraints(
                          maxWidth: 496,
                        ).r,
                        contentConstraints: const BoxConstraints(
                          maxWidth: 496,
                        ).r,
                        tabs: [
                          ShadTab(
                            value: 'get-started',
                            content: ShadCard(
                              backgroundColor: colors.dark400,
                              child: const PatientGetStartedForm(),
                            ),
                            child: const Text('Get Started'),
                          ),
                          ShadTab(
                            value: 'login',
                            content: ShadCard(
                              backgroundColor: colors.dark400,
                              child: const PatientLoginForm(),
                            ),
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                      64.verticalSpace,
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            '© ${DateTime.now().year} CarePulse',
                            style: textTheme.small.copyWith(
                              color: colors.dark600,
                            ),
                          ),
                          ShadButton.link(
                            onPressed: () {},
                            padding: .zero,
                            textStyle: textTheme.small,
                            foregroundColor: colors.green500,
                            child: const Text('Admin'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ResponsiveVisibility(
              visible: isLarge,
              child: Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: Assets.images.onboarding.image(
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
