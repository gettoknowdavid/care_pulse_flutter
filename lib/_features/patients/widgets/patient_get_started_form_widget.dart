import 'package:care_pulse_flutter/_features/patients/patients.dart';
import 'package:care_pulse_flutter/_routing/routes.dart';
import 'package:care_pulse_flutter/_shared/ui/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PatientGetStartedForm extends WatchingStatefulWidget {
  const PatientGetStartedForm({super.key});

  @override
  State<PatientGetStartedForm> createState() => _PatientGetStartedFormState();
}

class _PatientGetStartedFormState extends State<PatientGetStartedForm> {
  final _formKey = GlobalKey<ShadFormState>();

  final PatientsManagerRemote _manager = di<PatientsManagerRemote>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool obscureText = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isCreating = watchValue(
      (PatientsManagerRemote m) => m.createPatient.isRunning,
    );

    registerHandler(
      select: (PatientsManagerRemote m) => m.createPatient,
      handler: (context, session, cancel) {
        if (session == null) return;
        context.go(R.patientRegistration);
      },
    );

    registerHandler(
      select: (PatientsManagerRemote m) => m.createPatient.errors,
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
            id: 'name',
            leading: const Icon(PhosphorIconsRegular.user),
            label: const Text('Full Name'),
            placeholder: const Text('John Doe'),
            controller: _nameController,
            validator: (v) {
              if (v.length < 2) return 'Name must be at least 2 characters.';
              if (v.length > 50) return 'Name must be at most 50 characters';
              return null;
            },
          ),
          32.verticalSpace,
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
              if (v.length < 8) return 'Password must be at least 8 characters';
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
            enabled: !isCreating,
            isLoading: isCreating,
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;
              _manager.createPatient.run((
                name: _nameController.text,
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
