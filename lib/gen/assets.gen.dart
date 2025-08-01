/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Bamboo-Plants.webp
  AssetGenImage get bambooPlants =>
      const AssetGenImage('assets/images/Bamboo-Plants.webp');

  /// File path: assets/images/Bonsai-Plants.webp
  AssetGenImage get bonsaiPlants =>
      const AssetGenImage('assets/images/Bonsai-Plants.webp');

  /// File path: assets/images/Fruits-Plants.webp
  AssetGenImage get fruitsPlants =>
      const AssetGenImage('assets/images/Fruits-Plants.webp');

  /// File path: assets/images/Mango-Plants.webp
  AssetGenImage get mangoPlants =>
      const AssetGenImage('assets/images/Mango-Plants.webp');

  /// List of all assets
  List<AssetGenImage> get values => [
    bambooPlants,
    bonsaiPlants,
    fruitsPlants,
    mangoPlants,
  ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/lottie.json
  String get lottie => 'assets/lottie/lottie.json';

  /// File path: assets/lottie/lottie1.json
  String get lottie1 => 'assets/lottie/lottie1.json';

  /// File path: assets/lottie/lottie2.json
  String get lottie2 => 'assets/lottie/lottie2.json';

  /// List of all assets
  List<String> get values => [lottie, lottie1, lottie2];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
