import 'package:care_pulse_flutter/_shared/models/gender.dart';
import 'package:care_pulse_flutter/_shared/utils/enum_utils.dart';
import 'package:equatable/equatable.dart';

final class Patient with EquatableMixin {
  const Patient({
    required this.id,
    required this.userId,
    required this.email,
    required this.name,
    required this.phone,
    required this.privacyConsent,
    this.gender,
    this.dateOfBirth,
    this.address,
    this.occupation,
    this.emergencyContactName,
    this.emergencyContactNumber,
    this.insuranceProvider,
    this.insurancePolicyNumber,
    this.allergies,
    this.currentMedication,
    this.familyMedicalHistory,
    this.pastMedicalHistory,
    this.identificationType,
    this.identificationNumber,
    this.identificationDocId,
    this.identificationDocUrl,
    this.primaryPhysician,
    this.createdAt,
    this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      privacyConsent: json['privacy_consent'] as bool,
      gender: $enumDecodeNullable($GenderMap, json['gender']),
      dateOfBirth: json['date_of_birth'] != null
          ? DateTime.parse(json['date_of_birth'] as String)
          : null,
      address: json['address'] as String?,
      occupation: json['occupation'] as String?,
      emergencyContactName: json['emergency_contact_name'] as String?,
      emergencyContactNumber: json['emergency_contact_number'] as String?,
      insuranceProvider: json['insurance_provider'] as String?,
      insurancePolicyNumber: json['insurance_policy_number'] as String?,
      allergies: json['allergies'] as String?,
      currentMedication: json['current_medication'] as String?,
      familyMedicalHistory: json['family_medical_history'] as String?,
      pastMedicalHistory: json['past_medical_history'] as String?,
      identificationType: json['identification_type'] as String?,
      identificationNumber: json['identification_number'] as String?,
      identificationDocId: json['identification_doc_id'] as String?,
      identificationDocUrl: json['identification_doc_url'] as String?,
      primaryPhysician: json['primary_physician'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  static const Patient empty = Patient(
    id: '',
    userId: '',
    email: '',
    name: '',
    phone: '',
    privacyConsent: false,
  );

  final String id;
  final String userId;
  final String email;
  final String name;
  final String phone;
  final bool privacyConsent;
  final Gender? gender;
  final DateTime? dateOfBirth;
  final String? address;
  final String? occupation;
  final String? emergencyContactName;
  final String? emergencyContactNumber;
  final String? insuranceProvider;
  final String? insurancePolicyNumber;
  final String? allergies;
  final String? currentMedication;
  final String? familyMedicalHistory;
  final String? pastMedicalHistory;
  final String? identificationType;
  final String? identificationNumber;
  final String? identificationDocId;
  final String? identificationDocUrl;
  final String? primaryPhysician;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'email': email,
    'name': name,
    'phone': phone,
    'privacy_consent': privacyConsent,
    if (gender != null) 'gender': gender?.name,
    if (dateOfBirth != null) 'date_of_birth': dateOfBirth?.toIso8601String(),
    if (address != null) 'address': address,
    if (occupation != null) 'occupation': occupation,
    if (emergencyContactName != null)
      'emergency_contact_name': emergencyContactName,
    if (emergencyContactNumber != null)
      'emergency_contact_number': emergencyContactNumber,
    if (insuranceProvider != null) 'insurance_provider': insuranceProvider,
    if (insurancePolicyNumber != null)
      'insurance_policy_number': insurancePolicyNumber,
    if (allergies != null) 'allergies': allergies,
    if (currentMedication != null) 'current_medication': currentMedication,
    if (familyMedicalHistory != null)
      'family_medical_history': familyMedicalHistory,
    if (pastMedicalHistory != null) 'past_medical_history': pastMedicalHistory,
    if (identificationType != null) 'identification_type': identificationType,
    if (identificationNumber != null)
      'identification_number': identificationNumber,
    if (identificationDocId != null)
      'identification_doc_id': identificationDocId,
    if (identificationDocUrl != null)
      'identification_doc_url': identificationDocUrl,
    if (primaryPhysician != null) 'primary_physician': primaryPhysician,
  };

  @override
  List<Object?> get props => [
    id,
    userId,
    email,
    name,
    phone,
    privacyConsent,
    gender,
    dateOfBirth,
    address,
    occupation,
    emergencyContactName,
    emergencyContactNumber,
    insuranceProvider,
    insurancePolicyNumber,
    allergies,
    currentMedication,
    familyMedicalHistory,
    pastMedicalHistory,
    identificationType,
    identificationNumber,
    identificationDocId,
    identificationDocUrl,
    primaryPhysician,
    createdAt,
    updatedAt,
  ];
}
