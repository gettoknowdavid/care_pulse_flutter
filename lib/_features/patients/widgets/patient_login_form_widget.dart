import 'package:care_pulse_flutter/_features/patients/patients.dart';
import 'package:care_pulse_flutter/_routing/routes.dart';
import 'package:care_pulse_flutter/_shared/ui/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PatientLoginForm extends WatchingStatefulWidget {
  const PatientLoginForm({super.key});

  @override
  State<PatientLoginForm> createState() => _PatientLoginFormState();
}

class _PatientLoginFormState extends State<PatientLoginForm> {
  final _formKey = GlobalKey<ShadFormState>();

  final PatientsManagerRemote _manager = di<PatientsManagerRemote>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool obscureText = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoggingIn = watchValue(
      (PatientsManagerRemote m) => m.login.isRunning,
    );

    registerHandler(
      select: (PatientsManagerRemote m) => m.login,
      handler: (context, session, cancel) {
        if (session == null) return;
        context.go(R.home);
      },
    );

    registerHandler(
      select: (PatientsManagerRemote m) => m.login.errors,
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

    return ShadForm(
      key: _formKey,
      child: Column(
        crossAxisAlignment: .stretch,
        mainAxisSize: .min,
        children: [
          ShadInputFormField(
            id: 'email',
            leading: const Icon(PhosphorIconsRegular.envelope),
            label: const Text('Email'),
            placeholder: const Text('johndoe@gmail.com'),
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
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
          ShadInputFormField(
            id: 'password',
            leading: const Icon(PhosphorIconsRegular.lock),
            label: const Text('Password'),
            placeholder: const Text('Your password'),
            controller: _passwordController,
            obscureText: obscureText,
            validator: (v) {
              if (v.isEmpty) return 'Password is required';
              return null;
            },
            trailing: ShadButton(
              width: 24,
              height: 24,
              padding: EdgeInsets.zero,
              child: Icon(obscureText ? LucideIcons.eyeOff : LucideIcons.eye),
              onPressed: () => setState(() => obscureText = !obscureText),
            ),
          ),
          60.verticalSpace,
          PrimaryButton(
            label: 'Get Started',
            enabled: !isLoggingIn,
            isLoading: isLoggingIn,
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;
              _manager.login.run((
                email: _emailController.text,
                password: _passwordController.text,
              ));
            },
          ),
        ],
      ),
    );
  }
}
