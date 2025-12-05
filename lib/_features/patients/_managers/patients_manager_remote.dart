import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:care_pulse_flutter/_config/env.dart';
import 'package:care_pulse_flutter/_features/patients/patients.dart';
import 'package:care_pulse_flutter/_shared/models/scope.dart';
import 'package:care_pulse_flutter/_shared/services/backend_service.dart';
import 'package:flutter_it/flutter_it.dart';

final class PatientsManagerRemote with Disposable {
  PatientsManagerRemote(BackendService backend) : _backend = backend;

  final BackendService _backend;

  late final Command<NewPatientParams, Session?> createPatient = .createAsync(
    (params) async {
      final user = await _backend.account.create(
        userId: ID.unique(),
        email: params.email,
        password: params.password,
        name: params.name,
      );

      final session = await _backend.account.createEmailPasswordSession(
        email: user.email,
        password: params.password,
      );

      if (di.hasScope(Scope.newPatient)) await di.dropScope(Scope.newPatient);
      di.pushNewScope(scopeName: Scope.newPatient);
      di.registerSingleton<User>(user);
      di.registerSingleton<Session>(session);

      return session;
    },
    initialValue: null,
  );

  late final Command<PatientLoginParams, Session?> login = .createAsync(
    (params) async {
      final session = await _backend.account.createEmailPasswordSession(
        email: params.email,
        password: params.password,
      );

      final user = await _backend.account.get();

      final patient = await _getPatient(user.email);

      if (patient == null) {
        if (di.hasScope(Scope.newPatient)) await di.dropScope(Scope.newPatient);
        di.pushNewScope(scopeName: Scope.newPatient);
      } else {
        if (di.hasScope(Scope.patient)) await di.dropScope(Scope.patient);
        di.pushNewScope(scopeName: Scope.patient);
        di.registerSingleton<Patient>(patient);
      }

      di.registerSingleton<User>(user);
      di.registerSingleton<Session>(session);
      return session;
    },
    initialValue: null,
  );

  late final Command<void, void> logout = .createAsyncNoParamNoResult(
    () async {
      await _backend.account.deleteSessions();

      if (di.hasScope(Scope.unknown)) await di.dropScope(Scope.unknown);
      di.pushNewScope(scopeName: Scope.unknown);

      if (di.isRegistered<Session>()) di.unregister<Session>();
      if (di.isRegistered<User>()) di.unregister<User>();
    },
  );

  Future<Patient?> _getPatient(String email) async {
    try {
      final result = await _backend.tables.listRows(
        databaseId: Env.databaseId,
        tableId: 'patients',
        queries: [Query.equal('email', email)],
      );
      if (result.rows.isEmpty) return null;
      return Patient.fromJson(result.rows[0].data);
    } on Exception {
      return null;
    }
  }

  @override
  FutureOr<dynamic> onDispose() {
    createPatient.dispose();
  }
}
