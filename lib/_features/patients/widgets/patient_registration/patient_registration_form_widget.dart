import 'package:care_pulse_flutter/_shared/models/gender.dart';
import 'package:care_pulse_flutter/_shared/theme/app_theme.dart';
import 'package:care_pulse_flutter/_shared/ui/input/phone_input_form_field.dart';
import 'package:care_pulse_flutter/_shared/utils/system_internal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PatientRegistrationForm extends StatefulWidget {
  const PatientRegistrationForm({super.key});

  @override
  State<PatientRegistrationForm> createState() =>
      _PatientRegistrationFormState();
}

class _PatientRegistrationFormState extends State<PatientRegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return ShadForm(
      child: Column(
        crossAxisAlignment: .stretch,
        mainAxisSize: .min,
        children: [
          const _PersonalInfoSection(),
          32.verticalSpace,
          const _MedicalInfoSection(),
        ],
      ),
    );
  }
}

class _PersonalInfoSection extends StatefulWidget {
  const _PersonalInfoSection();

  @override
  State<_PersonalInfoSection> createState() => _PersonalInfoSectionState();
}

class _PersonalInfoSectionState extends State<_PersonalInfoSection> {
  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;

    final isLarge = ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);

    return Column(
      crossAxisAlignment: .stretch,
      mainAxisSize: .min,
      children: [
        Text('Personal Information', style: textTheme.h3),
        36.verticalSpace,
        ShadInputFormField(
          id: 'name',
          leading: const Icon(LucideIcons.user),
          label: const Text('Full Name'),
          placeholder: const Text('John Doe'),
          validator: (v) {
            if (v.length < 2) return 'Name must be at least 2 characters.';
            if (v.length > 50) return 'Name must be at most 50 characters';
            return null;
          },
        ),
        16.verticalSpace,
        ResponsiveRowColumn(
          columnMainAxisSize: .min,
          rowMainAxisSize: .min,
          layout: SI.resolve(
            isLarge,
            ResponsiveRowColumnType.ROW,
            ResponsiveRowColumnType.COLUMN,
          ),
          columnSpacing: 16.h,
          rowSpacing: 16.w,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: ShadInputFormField(
                id: 'email',
                leading: const Icon(LucideIcons.mail),
                label: const Text('Email'),
                placeholder: const Text('johndoe@gmail.com'),
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v.isEmpty) return 'Email is required';
                  final regex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!regex.hasMatch(v)) return 'Invalid email address';
                  return null;
                },
              ),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: PhoneInputFormField(
                id: 'phone',
                label: const Text('Phone Number'),
                placeholder: const Text('8160285225'),
                validator: (v) {
                  final n = v?.number;
                  if (n == null || n.isEmpty) return 'Phone number is required';
                  return null;
                },
              ),
            ),
          ],
        ),
        16.verticalSpace,
        ResponsiveRowColumn(
          columnMainAxisSize: .min,
          rowMainAxisSize: .min,
          layout: SI.resolve(
            isLarge,
            ResponsiveRowColumnType.ROW,
            ResponsiveRowColumnType.COLUMN,
          ),
          columnSpacing: 16.h,
          rowSpacing: 16.w,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: ShadDatePickerFormField(
                label: const Text('Date of birth'),
                onChanged: print,
                width: double.infinity,
                buttonPadding: const EdgeInsets.all(12).r,
                icon: const Icon(LucideIcons.calendar),
                popoverDecoration: ShadDecoration(color: colors.dark400),
                allowDeselection: true,
                buttonDecoration: ShadDecoration(
                  color: colors.dark400,
                  border: ShadBorder.all(color: colors.dark500),
                ),
                anchor: const ShadAnchor(),
              ),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: ShadRadioGroupFormField<Gender>(
                runSpacing: 0,
                label: const Text('Gender'),
                alignment: .start,
                runAlignment: .start,
                crossAxisAlignment: .start,

                spacing: 8.w,
                axis: Axis.horizontal,
                items: Gender.values.map(
                  (e) => ShadCard(
                    padding: const EdgeInsets.fromLTRB(12, 12, 32, 12).r,
                    child: ShadRadio(value: e, label: Text(e.name), size: 14.r),
                  ),
                ),
              ),
            ),
          ],
        ),
        16.verticalSpace,
        ResponsiveRowColumn(
          columnMainAxisSize: .min,
          rowMainAxisSize: .min,
          layout: SI.resolve(
            isLarge,
            ResponsiveRowColumnType.ROW,
            ResponsiveRowColumnType.COLUMN,
          ),
          columnSpacing: 16.h,
          rowSpacing: 16.w,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: ShadInputFormField(
                id: 'address',
                label: const Text('Address'),
                placeholder: const Text('14 street, John Doe Close'),
                validator: (v) {
                  if (v.isEmpty) return null;
                  if (v.length > 100) return 'Max characters exceeded';
                  return null;
                },
              ),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: ShadInputFormField(
                id: 'occupation',
                label: const Text('Occupation'),
                placeholder: const Text('Software Engineer'),
                validator: (v) {
                  if (v.isEmpty) return null;
                  if (v.length > 100) return 'Max characters exceeded';
                  return null;
                },
              ),
            ),
          ],
        ),
        16.verticalSpace,
        ResponsiveRowColumn(
          columnMainAxisSize: .min,
          rowMainAxisSize: .min,
          layout: SI.resolve(
            isLarge,
            ResponsiveRowColumnType.ROW,
            ResponsiveRowColumnType.COLUMN,
          ),
          columnSpacing: 16.h,
          rowSpacing: 16.w,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: ShadInputFormField(
                id: 'emergency_contact_name',
                label: const Text('Emergency Contact Name'),
                placeholder: const Text('Name of your emergency contact'),
                validator: (v) {
                  if (v.isEmpty) return null;
                  if (v.length > 100) return 'Max characters exceeded';
                  return null;
                },
              ),
            ),
            const ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: PhoneInputFormField(
                id: 'emergency_contact_phone',
                label: Text('Emergency Contact Phone Number'),
                placeholder: Text('8160285225'),
              ),
            ),
          ],
        ),
        16.verticalSpace,
      ],
    );
  }
}

class _MedicalInfoSection extends StatefulWidget {
  const _MedicalInfoSection();

  @override
  State<_MedicalInfoSection> createState() => _MedicalInfoSectionState();
}

class _MedicalInfoSectionState extends State<_MedicalInfoSection> {
  @override
  Widget build(BuildContext context) {
    final shadTheme = ShadTheme.of(context);
    final textTheme = shadTheme.textTheme;

    return Column(
      crossAxisAlignment: .stretch,
      mainAxisSize: .min,
      children: [
        Text('Medical Information', style: textTheme.h3),
        36.verticalSpace,
        ShadSelectFormField<String>(
          id: 'primary_care_physician',
          label: const Text('Primary Care Physician'),
          minWidth: 622.w,
          options: [
            'Dr John',
            'Dr John Doe',
          ].map((e) => ShadOption(value: e, child: Text(e))).toList(),
          maxWidth: double.infinity,
          anchor: const ShadAnchor(),
          selectedOptionBuilder: (context, value) => value == 'none'
              ? const Text('Select a primary care physician')
              : Text(value),
          placeholder: const Text('Select a primary care physician'),
          validator: (v) {
            if (v == null) return 'Please select a primary care physician';
            return null;
          },
        ),
        36.verticalSpace,
      ],
    );
  }
}
