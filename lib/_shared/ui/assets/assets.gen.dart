// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

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

  /// File path: assets/images/loader.svg
  SvgGenImage get loader => const SvgGenImage('assets/images/loader.svg');

  /// File path: assets/images/logo-full.svg
  SvgGenImage get logoFull => const SvgGenImage('assets/images/logo-full.svg');

  /// File path: assets/images/logo-icon.svg
  SvgGenImage get logoIcon => const SvgGenImage('assets/images/logo-icon.svg');

  /// File path: assets/images/onboarding.jpg
  AssetGenImage get onboarding =>
      const AssetGenImage('assets/images/onboarding.jpg');

  /// File path: assets/images/pending-bg.png
  AssetGenImage get pendingBg =>
      const AssetGenImage('assets/images/pending-bg.png');

  /// File path: assets/images/register-img.png
  AssetGenImage get registerImg =>
      const AssetGenImage('assets/images/register-img.png');

  /// List of all assets
  List<dynamic> get values => [
    appointmentImg,
    appointmentsBg,
    cancelledBg,
    loader,
    logoFull,
    logoIcon,
    onboarding,
    pendingBg,
    registerImg,
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

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
