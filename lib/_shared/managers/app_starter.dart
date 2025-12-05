import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:care_pulse_flutter/_config/env.dart';
import 'package:care_pulse_flutter/_features/patients/_models/patient.dart';
import 'package:care_pulse_flutter/_shared/models/scope.dart';
import 'package:care_pulse_flutter/_shared/services/backend_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_it/flutter_it.dart';

class AppStarter with ChangeNotifier {
  AppStarter(BackendService backend) : _backend = backend;

  final BackendService _backend;

  Future<AppStarter> get start async {
    final user = await _getUser();

    if (user == null) {
      if (di.hasScope(Scope.unknown)) await di.dropScope(Scope.unknown);
      di.pushNewScope(scopeName: Scope.unknown);
      notifyListeners();
      return this;
    }

    final patient = await _getPatient(user.email);
    if (patient == null) {
      if (di.hasScope(Scope.newPatient)) await di.dropScope(Scope.newPatient);
      di.pushNewScope(scopeName: Scope.newPatient);
      di.registerSingleton<User>(user);
      notifyListeners();
      return this;
    }

    if (di.hasScope(Scope.patient)) await di.dropScope(Scope.patient);
    di.pushNewScope(scopeName: Scope.patient);
    di.registerSingleton<Patient>(patient);
    notifyListeners();
    return this;
  }

  Future<User?> _getUser() async {
    try {
      final result = await _backend.account.get();
      return result;
    } on AppwriteException catch (_) {
      return null;
    }
  }

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
}
