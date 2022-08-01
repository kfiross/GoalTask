import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Sizes Configurations especially for fonts
class _SizeConfigFonts{
  static const _SizeConfigFonts _instance = _SizeConfigFonts._();

  factory _SizeConfigFonts() => _instance;

  const _SizeConfigFonts._();

  double get subscription => SizeConfig.safeBlockHorizontal * 30 * SizeConfig.safeIsMobile;

  double get huge => SizeConfig.safeBlockHorizontal * 10 * SizeConfig.safeIsMobile;
  double get extra => SizeConfig.safeBlockHorizontal * 7 * SizeConfig.safeIsMobile;
  double get large => SizeConfig.safeBlockHorizontal * 6 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get medium_plus => SizeConfig.safeBlockHorizontal * 5.25 * SizeConfig.safeIsMobile;
  double get medium => SizeConfig.safeBlockHorizontal * 4.5 * SizeConfig.safeIsMobile;
  double get normal => SizeConfig.safeBlockHorizontal * 4 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get small_plus => SizeConfig.safeBlockHorizontal * 3.5 * SizeConfig.safeIsMobile;

  double get small => SizeConfig.safeBlockHorizontal * 3 * SizeConfig.safeIsMobile;

  double get mini => SizeConfig.safeBlockHorizontal * 2 * SizeConfig.safeIsMobile;

  // ignore: non_constant_identifier_names
  double get main_screen => SizeConfig.safeBlockHorizontal * 5 * SizeConfig.safeIsMobile;
}

/// Sizes Configurations especially for spacing

class _SizeConfigSpacing{
  static const _SizeConfigSpacing _instance = _SizeConfigSpacing._();

  factory _SizeConfigSpacing() => _instance;

  const _SizeConfigSpacing._();


  // ignore: non_constant_identifier_names
  double get mini_vertical => SizeConfig.safeBlockVertical * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get small_vertical => SizeConfig.safeBlockVertical * 2 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get small_plus_vertical => SizeConfig.safeBlockVertical * 2.5 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get medium_vertical => SizeConfig. safeBlockVertical * 3 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get medium_plus_vertical => SizeConfig.safeBlockVertical * 4 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get large_vertical => SizeConfig.safeBlockVertical * 7 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get extra_vertical => SizeConfig.safeBlockVertical * 9 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get small_horizontal => SizeConfig.safeBlockHorizontal * 2 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get small_plus_horizontal => SizeConfig.safeBlockHorizontal * 2.5 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get medium_plus_horizontal => SizeConfig.safeBlockVertical * 5 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get medium_horizontal => SizeConfig.safeBlockVertical * 3 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get normal_horizontal => SizeConfig.safeBlockVertical * 4 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get large_horizontal => SizeConfig.safeBlockVertical * 7 * SizeConfig.safeIsMobile;
  // ignore: non_constant_identifier_names
  double get extra_horizontal => SizeConfig.safeBlockVertical * 9 * SizeConfig.safeIsMobile;
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late double safeIsMobile = 1.0;

  static late double fullScreenWidth;
  static late double fullScreenHeight;
  static late double devicePixelRatio;

  static final SizeConfig _instance = SizeConfig._();

  factory SizeConfig() => _instance;

  SizeConfig._();

  /// "SubClassing" fonts and spacing values
  static _SizeConfigFonts font = _SizeConfigFonts();
  static _SizeConfigSpacing spacing = _SizeConfigSpacing();

  void init(BuildContext context) {
    safeIsMobile = kIsWeb ? 0.8 : 1.0;
    _mediaQueryData = MediaQuery.of(context);
    devicePixelRatio = _mediaQueryData.devicePixelRatio;
    fullScreenHeight = _mediaQueryData.size.height;
    fullScreenWidth = _mediaQueryData.size.width;
    screenWidth = _mediaQueryData.size.width * safeIsMobile;
    screenHeight = _mediaQueryData.size.height * safeIsMobile;
    blockSizeHorizontal = screenWidth / 100 * safeIsMobile;
    blockSizeVertical = screenHeight / 100 * safeIsMobile;

    _safeAreaHorizontal = (_mediaQueryData.padding.left + _mediaQueryData.padding.right) * safeIsMobile;
    _safeAreaVertical = (_mediaQueryData.padding.top + _mediaQueryData.padding.bottom) * safeIsMobile;
    safeBlockHorizontal = ((screenWidth - _safeAreaHorizontal) / 100) * safeIsMobile;
    safeBlockVertical = ((screenHeight - _safeAreaVertical) / 100) * safeIsMobile;
    safeBlockHorizontal = safeBlockHorizontal > 4.0? 4.0:safeBlockHorizontal;
    safeBlockVertical = safeBlockVertical > 8.0? 8.0:safeBlockVertical;
  }
}
