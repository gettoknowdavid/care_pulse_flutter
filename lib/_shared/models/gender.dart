enum Gender { male, female, other }

const Map<Gender, String> $GenderMap = {
  .male: 'male',
  .female: 'female',
  .other: 'other',
};

extension GenderX on Gender {
  String get name => switch (this) {
    .male => 'Male',
    .female => 'Female',
    .other => 'Other',
  };
}
