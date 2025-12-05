/// Environment variables and shared app constants.
abstract class Env {
  static const String projectId = String.fromEnvironment('PROJECT_ID');
  static const String projectName = String.fromEnvironment('PROJECT_NAME');
  static const String endpoint = String.fromEnvironment('PUBLIC_ENDPOINT');
  static const String apiKey = String.fromEnvironment('API_KEY');
  static const String databaseId = String.fromEnvironment('DATABASE_ID');
  static const String storageId = String.fromEnvironment('STORAGE_ID');
}
