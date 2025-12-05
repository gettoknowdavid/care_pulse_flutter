import 'package:care_pulse_flutter/_features/patients/_managers/patients_manager_remote.dart';
import 'package:care_pulse_flutter/_shared/managers/app_starter.dart';
import 'package:care_pulse_flutter/_shared/services/backend_service.dart';
import 'package:flutter_it/flutter_it.dart';

Future<void> configureDependencies() async {
  di.registerLazySingletonAsync(BackendService.instance);
  await di.isReady<BackendService>();

  di.registerSingleton(PatientsManagerRemote(di<BackendService>()));
  di.registerLazySingletonAsync(() => AppStarter(di<BackendService>()).start);
  await di.isReady<AppStarter>();

  await di.allReady();
}
