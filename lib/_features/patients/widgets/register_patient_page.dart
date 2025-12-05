import 'package:care_pulse_flutter/_features/patients/_managers/patients_manager_remote.dart';
import 'package:care_pulse_flutter/_routing/routes.dart';
import 'package:care_pulse_flutter/_shared/ui/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RegisterPatientPage extends WatchingStatefulWidget {
  const RegisterPatientPage({super.key});

  @override
  State<RegisterPatientPage> createState() => _RegisterPatientPageState();
}

class _RegisterPatientPageState extends State<RegisterPatientPage> {
  final PatientsManagerRemote _manager = di<PatientsManagerRemote>();

  @override
  Widget build(BuildContext context) {
    final isLoggingOut = watchValue(
      (PatientsManagerRemote m) => m.logout.isRunning,
    );

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

    return Scaffold(
      appBar: AppBar(title: const Text('Register Patient')),
      body: Center(
        child: PrimaryButton(
          label: 'Logout',
          isLoading: isLoggingOut,
          enabled: !isLoggingOut,
          onPressed: _manager.logout.run,
        ),
      ),
    );
  }
}
