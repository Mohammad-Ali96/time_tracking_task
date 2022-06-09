/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsGeneralGen get general => const $AssetsIconsGeneralGen();
  $AssetsIconsTaskGen get task => const $AssetsIconsTaskGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/jeremy.png
  AssetGenImage get jeremy => const AssetGenImage('assets/images/jeremy.png');
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar.json
  String get ar => 'assets/translations/ar.json';

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';
}

class $AssetsIconsGeneralGen {
  const $AssetsIconsGeneralGen();

  /// File path: assets/icons/general/icon-ellipsis.svg
  String get iconEllipsis => 'assets/icons/general/icon-ellipsis.svg';
}

class $AssetsIconsTaskGen {
  const $AssetsIconsTaskGen();

  /// File path: assets/icons/task/icon-exercise.svg
  String get iconExercise => 'assets/icons/task/icon-exercise.svg';

  /// File path: assets/icons/task/icon-play.svg
  String get iconPlay => 'assets/icons/task/icon-play.svg';

  /// File path: assets/icons/task/icon-self-care.svg
  String get iconSelfCare => 'assets/icons/task/icon-self-care.svg';

  /// File path: assets/icons/task/icon-social.svg
  String get iconSocial => 'assets/icons/task/icon-social.svg';

  /// File path: assets/icons/task/icon-study.svg
  String get iconStudy => 'assets/icons/task/icon-study.svg';

  /// File path: assets/icons/task/icon-work.svg
  String get iconWork => 'assets/icons/task/icon-work.svg';
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  String get path => _assetName;

  String get keyName => _assetName;
}
