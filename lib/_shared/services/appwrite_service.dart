import 'package:appwrite/appwrite.dart';
import 'package:care_pulse_flutter/_config/env.dart';

final class AppwriteService {
  AppwriteService._(this._client);

  final Client _client;

  static Future<AppwriteService> instance() async {
    final client = Client()
      ..setProject(Env.projectId)
      ..setEndpoint(Env.endpoint);

    return AppwriteService._(client);
  }

  Account get account => Account(_client);

  Databases get databases => Databases(_client);

  Messaging get messaging => Messaging(_client);

  Storage get storage => Storage(_client);
}
