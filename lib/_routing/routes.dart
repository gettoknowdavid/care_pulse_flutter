final class R {
  const R._();

  static List<String> publicRoutes = [
    R.loading,
    R.onboarding,
  ];

  static const String loading = '/loading';

  static const String onboarding = '/onboarding';

  static const String patients = '/patients';

  static String patient(String id) => '/patients/$id';

  static const String patientRegistration = '/patients-registration';

  static const String login = '/login';

  static const String forgotPassword = '/forgot-password';

  static const String home = '/';
}
