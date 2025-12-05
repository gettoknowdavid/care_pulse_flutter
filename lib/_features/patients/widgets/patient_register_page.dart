import 'package:appwrite/models.dart';
import 'package:care_pulse_flutter/_features/patients/_managers/patients_manager_remote.dart';
import 'package:care_pulse_flutter/_routing/routes.dart';
import 'package:care_pulse_flutter/_shared/ui/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PatientRegisterPage extends WatchingStatefulWidget {
  const PatientRegisterPage({super.key});

  @override
  State<PatientRegisterPage> createState() => _PatientRegisterPageState();
}

class _PatientRegisterPageState extends State<PatientRegisterPage> {
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
        child: Column(
          children: [
            Text(di<User>().$id, textAlign: TextAlign.center),
            60.verticalSpace,
            PrimaryButton(
              label: 'Logout',
              isLoading: isLoggingOut,
              enabled: !isLoggingOut,
              onPressed: _manager.logout.run,
            ),
          ],
        ),
      ),
    );
  }
}
