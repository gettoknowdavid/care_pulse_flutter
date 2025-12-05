import 'package:care_pulse_flutter/_features/home/widgets/home_page.dart';
import 'package:care_pulse_flutter/_features/patients/patients.dart';
import 'package:care_pulse_flutter/_routing/routes.dart';
import 'package:care_pulse_flutter/_shared/managers/app_starter.dart';
import 'package:care_pulse_flutter/_shared/models/scope.dart';
import 'package:care_pulse_flutter/_shared/ui/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:go_router/go_router.dart';

GoRouter routerConfig() {
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final nextRoute = state.matchedLocation;
    final scope = di.currentScopeName;
    switch (scope) {
      case Scope.unknown:
        final allowed = [R.onboarding, R.loading];
        return allowed.contains(nextRoute) ? null : R.onboarding;
      case Scope.newPatient:
        return R.patientRegistration;
      default:
        return R.loading;
    }
  }

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: R.home,
    redirect: redirect,
    refreshListenable: di<AppStarter>(),
    routes: [
      GoRoute(
        path: R.loading,
        builder: (context, state) => const Scaffold(
          body: Center(child: LoadingIndicator()),
        ),
      ),
      GoRoute(
        path: R.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: R.patients,
        builder: (context, state) => const PatientsPage(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) => const PatientDetailsPage(),
          ),
        ],
      ),
      GoRoute(
        path: R.patientRegistration,
        builder: (context, state) => const PatientRegisterPage(),
      ),
      GoRoute(
        path: R.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
