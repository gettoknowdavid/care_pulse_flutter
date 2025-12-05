import 'package:care_pulse_flutter/_config/dependency_injection.dart';
import 'package:care_pulse_flutter/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  });
  if (kIsWeb) usePathUrlStrategy();
  await configureDependencies();
  runApp(const CarePulseApp());
}
