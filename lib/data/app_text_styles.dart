import 'package:flutter/material.dart';

/// Holds the different application text styles
///
///
/// - The naming for this class [AppTextStyles]'s properties is like this:
///   `s(font-size) w(font-weight) l(line-height)`
///
///      - Note if a value has decimals, the decimal should be replaced with
///        the letter `p`. For example, `10.5` will be represented as `10p5`.
///
///
///   So, for a [TextStyle] with the following details:
///  `font-size` : `10.0`
///  `font-weight` : `700.0`
///  `line-height` : `12.5`
///
///   The [TextStyle] name will be `s10w700l12p5`
///
/// - To get the [TextStyle], use the [getTextStyle] method.
class AppTextStyles {
  static final TextStyle s32w700l42 = getTextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    lineHeight: 42,
  );
  static final TextStyle s24w700l31 = getTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    lineHeight: 31.2,
  );
  static final TextStyle s14w400l21 = getTextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    lineHeight: 21,
  );
  static final TextStyle s16w700l24 = getTextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    lineHeight: 24,
  );
  static final TextStyle s14w400l22 = getTextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    lineHeight: 22,
  );
    static final TextStyle s16w400l24 = getTextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    lineHeight: 24,
  );

  /// Returns the [TextStyle] from the [fontSize], [fontWeight]
  /// and [lineHeight] parameters.
  ///
  ///
  /// - The [TextStyle.height] property is calculated by [lineHeight]/[fontSize]`
  ///
  ///   E.g if the [fontSize] is `20.0` and the [lineHeight] is `10.0`,cxzz
  ///   `height` = `10.0/20.0`.
  ///
  ///   Reference: https://api.flutter.dev/flutter/painting/TextStyle/height.html

  static TextStyle getTextStyle(
      {required double fontSize,
      required FontWeight fontWeight,
      required double lineHeight}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineHeight / fontSize);
  }
}
