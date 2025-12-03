// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $FontsGen {
  const $FontsGen();

  /// File path: fonts/OFL.txt
  String get ofl => 'fonts/OFL.txt';

  /// File path: fonts/PlusJakartaSans-Bold.ttf
  String get plusJakartaSansBold => 'fonts/PlusJakartaSans-Bold.ttf';

  /// File path: fonts/PlusJakartaSans-Light.ttf
  String get plusJakartaSansLight => 'fonts/PlusJakartaSans-Light.ttf';

  /// File path: fonts/PlusJakartaSans-Medium.ttf
  String get plusJakartaSansMedium => 'fonts/PlusJakartaSans-Medium.ttf';

  /// File path: fonts/PlusJakartaSans-Regular.ttf
  String get plusJakartaSansRegular => 'fonts/PlusJakartaSans-Regular.ttf';

  /// File path: fonts/PlusJakartaSans-SemiBold.ttf
  String get plusJakartaSansSemiBold => 'fonts/PlusJakartaSans-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
    ofl,
    plusJakartaSansBold,
    plusJakartaSansLight,
    plusJakartaSansMedium,
    plusJakartaSansRegular,
    plusJakartaSansSemiBold,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/appointment-img.png
  AssetGenImage get appointmentImg =>
      const AssetGenImage('assets/images/appointment-img.png');

  /// File path: assets/images/appointments-bg.png
  AssetGenImage get appointmentsBg =>
      const AssetGenImage('assets/images/appointments-bg.png');

  /// File path: assets/images/cancelled-bg.png
  AssetGenImage get cancelledBg =>
      const AssetGenImage('assets/images/cancelled-bg.png');

  /// File path: assets/images/pending-bg.png
  AssetGenImage get pendingBg =>
      const AssetGenImage('assets/images/pending-bg.png');

  /// File path: assets/images/register-img.png
  AssetGenImage get registerImg =>
      const AssetGenImage('assets/images/register-img.png');

  /// File path: assets/images/team-young-specialist-doctors-standing-corridor-hospital.jpg
  AssetGenImage
  get teamYoungSpecialistDoctorsStandingCorridorHospital => const AssetGenImage(
    'assets/images/team-young-specialist-doctors-standing-corridor-hospital.jpg',
  );

  /// List of all assets
  List<AssetGenImage> get values => [
    appointmentImg,
    appointmentsBg,
    cancelledBg,
    pendingBg,
    registerImg,
    teamYoungSpecialistDoctorsStandingCorridorHospital,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $FontsGen fonts = $FontsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
