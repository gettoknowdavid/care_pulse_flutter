import 'package:care_pulse_flutter/_shared/services/appwrite_service.dart';
import 'package:flutter_it/flutter_it.dart';

void configureDependencies() {
  di.registerSingletonAsync<AppwriteService>(AppwriteService.instance);
}
