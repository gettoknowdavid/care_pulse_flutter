import 'dart:developer';

import 'package:care_pulse_flutter/_shared/theme/app_theme.dart';
import 'package:care_pulse_flutter/_shared/ui/assets/assets.gen.dart';
import 'package:care_pulse_flutter/_shared/ui/input/phone_input_form_field.dart';
import 'package:care_pulse_flutter/_shared/ui/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;

    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints.expand(width: 496).r,
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .center,
                    children: [
                      Assets.images.logoFull.svg(),
                      48.verticalSpace,
                      const LoginForm(),
                      64.verticalSpace,
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            '© 2025 CarePulse. All rights reserved.',
                            style: textTheme.small.copyWith(
                              color: colors.dark600,
                            ),
                          ),
                          ShadButton.link(
                            onPressed: () {},
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
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: Assets.images.onboarding.image(
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<ShadFormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;

    return ShadForm(
      key: _formKey,
      child: Column(
        crossAxisAlignment: .stretch,
        mainAxisSize: .min,
        children: [
          Text('Hi there 👋', style: textTheme.h2),
          Text(
            'Get started with appointments.',
            style: textTheme.p.copyWith(color: colors.dark700),
          ),
          48.verticalSpace,
          ShadInputFormField(
            id: 'name',
            leading: const Icon(PhosphorIconsRegular.user),
            label: const Text('Full Name'),
            placeholder: const Text('John Doe'),
            validator: (v) {
              if (v.length < 2) return 'Name must be at least 2 characters.';
              if (v.length > 50) return 'Name must be at most 50 characters';
              return null;
            },
          ),
          32.verticalSpace,
          ShadInputFormField(
            id: 'email',
            leading: const Icon(PhosphorIconsRegular.at),
            label: const Text('Email'),
            placeholder: const Text('johndoe@gmail.com'),
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v.isEmpty) return 'Email is required';
              final regex = RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              );
              if (!regex.hasMatch(v)) return 'Invalid email address';
              return null;
            },
          ),
          32.verticalSpace,
          PhoneInputFormField(
            id: 'phone',
            onChanged: (v) => log(v.toString()),
            label: const Text('Phone Number'),
            placeholder: const Text('08134567890'),
            validator: (input) {
              final val = input?.number;
              if (val == null || val.isEmpty) return 'Phone number is required';
              return null;
            },
          ),
          60.verticalSpace,
          PrimaryButton(
            label: 'Submit',
            onPressed: () {
              if (_formKey.currentState!.saveAndValidate()) {
                log('Succeeded with ${_formKey.currentState!.value}');
              } else {
                log('Failed');
              }
            },
          ),
        ],
      ),
    );
  }
}
