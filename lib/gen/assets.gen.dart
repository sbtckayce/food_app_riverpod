/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  $AssetsFontsUbuntuGen get ubuntu => const $AssetsFontsUbuntuGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bank_icon.png
  AssetGenImage get bankIcon =>
      const AssetGenImage('assets/images/bank_icon.png');

  /// File path: assets/images/cart_icon.png
  AssetGenImage get cartIcon =>
      const AssetGenImage('assets/images/cart_icon.png');

  /// File path: assets/images/credit_icon.png
  AssetGenImage get creditIcon =>
      const AssetGenImage('assets/images/credit_icon.png');

  /// File path: assets/images/hat_img.png
  AssetGenImage get hatImg => const AssetGenImage('assets/images/hat_img.png');

  /// File path: assets/images/hat_imgx4.png
  AssetGenImage get hatImgx4 =>
      const AssetGenImage('assets/images/hat_imgx4.png');

  /// File path: assets/images/heart_icon.png
  AssetGenImage get heartIcon =>
      const AssetGenImage('assets/images/heart_icon.png');

  /// File path: assets/images/history_icon.png
  AssetGenImage get historyIcon =>
      const AssetGenImage('assets/images/history_icon.png');

  /// File path: assets/images/home_icon.png
  AssetGenImage get homeIcon =>
      const AssetGenImage('assets/images/home_icon.png');

  /// File path: assets/images/menu_icon.png
  AssetGenImage get menuIcon =>
      const AssetGenImage('assets/images/menu_icon.png');

  /// File path: assets/images/no_cart_icon.png
  AssetGenImage get noCartIcon =>
      const AssetGenImage('assets/images/no_cart_icon.png');

  /// File path: assets/images/no_history_icon.png
  AssetGenImage get noHistoryIcon =>
      const AssetGenImage('assets/images/no_history_icon.png');

  /// File path: assets/images/no_wifi_icon.png
  AssetGenImage get noWifiIcon =>
      const AssetGenImage('assets/images/no_wifi_icon.png');

  /// File path: assets/images/paypal_icon.png
  AssetGenImage get paypalIcon =>
      const AssetGenImage('assets/images/paypal_icon.png');

  /// File path: assets/images/person1_img.png
  AssetGenImage get person1Img =>
      const AssetGenImage('assets/images/person1_img.png');

  /// File path: assets/images/person2_img.png
  AssetGenImage get person2Img =>
      const AssetGenImage('assets/images/person2_img.png');

  /// File path: assets/images/search_icon.png
  AssetGenImage get searchIcon =>
      const AssetGenImage('assets/images/search_icon.png');

  /// File path: assets/images/user_icon.png
  AssetGenImage get userIcon =>
      const AssetGenImage('assets/images/user_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bankIcon,
        cartIcon,
        creditIcon,
        hatImg,
        hatImgx4,
        heartIcon,
        historyIcon,
        homeIcon,
        menuIcon,
        noCartIcon,
        noHistoryIcon,
        noWifiIcon,
        paypalIcon,
        person1Img,
        person2Img,
        searchIcon,
        userIcon
      ];
}

class $AssetsFontsUbuntuGen {
  const $AssetsFontsUbuntuGen();

  /// File path: assets/fonts/Ubuntu/UFL.txt
  String get ufl => 'assets/fonts/Ubuntu/UFL.txt';

  /// File path: assets/fonts/Ubuntu/Ubuntu-Bold.ttf
  String get ubuntuBold => 'assets/fonts/Ubuntu/Ubuntu-Bold.ttf';

  /// File path: assets/fonts/Ubuntu/Ubuntu-BoldItalic.ttf
  String get ubuntuBoldItalic => 'assets/fonts/Ubuntu/Ubuntu-BoldItalic.ttf';

  /// File path: assets/fonts/Ubuntu/Ubuntu-Italic.ttf
  String get ubuntuItalic => 'assets/fonts/Ubuntu/Ubuntu-Italic.ttf';

  /// File path: assets/fonts/Ubuntu/Ubuntu-Light.ttf
  String get ubuntuLight => 'assets/fonts/Ubuntu/Ubuntu-Light.ttf';

  /// File path: assets/fonts/Ubuntu/Ubuntu-LightItalic.ttf
  String get ubuntuLightItalic => 'assets/fonts/Ubuntu/Ubuntu-LightItalic.ttf';

  /// File path: assets/fonts/Ubuntu/Ubuntu-Medium.ttf
  String get ubuntuMedium => 'assets/fonts/Ubuntu/Ubuntu-Medium.ttf';

  /// File path: assets/fonts/Ubuntu/Ubuntu-MediumItalic.ttf
  String get ubuntuMediumItalic =>
      'assets/fonts/Ubuntu/Ubuntu-MediumItalic.ttf';

  /// File path: assets/fonts/Ubuntu/Ubuntu-Regular.ttf
  String get ubuntuRegular => 'assets/fonts/Ubuntu/Ubuntu-Regular.ttf';

  /// List of all assets
  List<String> get values => [
        ufl,
        ubuntuBold,
        ubuntuBoldItalic,
        ubuntuItalic,
        ubuntuLight,
        ubuntuLightItalic,
        ubuntuMedium,
        ubuntuMediumItalic,
        ubuntuRegular
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
