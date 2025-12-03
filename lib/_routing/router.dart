import 'package:care_pulse_flutter/_features/home/widgets/home_page.dart';
import 'package:care_pulse_flutter/_features/onboarding/widgets/onboarding_page.dart';
import 'package:care_pulse_flutter/_routing/routes.dart';
import 'package:go_router/go_router.dart';

GoRouter routerConfig() {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: R.onboarding,
    routes: [
      GoRoute(
        path: R.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: R.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
