import 'package:appwrite/appwrite.dart';
import 'package:care_pulse_flutter/_config/env.dart';

final class BackendService {
  BackendService._(this._client);

  final Client _client;

  static Future<BackendService> instance() async {
    final client = Client()
      ..setProject(Env.projectId)
      ..setEndpoint(Env.endpoint);

    return BackendService._(client);
  }

  Account get account => Account(_client);

  Databases get databases => Databases(_client);

  TablesDB get tables => TablesDB(_client);

  Messaging get messaging => Messaging(_client);

  Storage get storage => Storage(_client);
}
