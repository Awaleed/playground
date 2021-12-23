import 'package:flutter/material.dart';
import '../helpers/ui_utils.dart';

// Should be set in splash.dart file
late AppSizes kAppSizes;
MaterialColor get kMainColor => const Color(0xFF04AAFF).createMaterialColor();
// MaterialColor get kAppGreen => const Color(0xff63cf98).createMaterialColor();
// MaterialColor get kAppBlue => const Color(0xff024E95).createMaterialColor();
// MaterialColor get kAppGrey => const Color(0xffAEAEAE).createMaterialColor();
const String kAuthBackgroundImage = 'assets/images/bg.png';
const String kAppLogo = 'assets/images/logo.png';

const kSecoundryColor = Color(0xff278E8C);
const kGreenColor = Color(0xFF4CAF50);
const kPrimaryTextColor = Color(0xFF212121);
const kTextColor = Color(0xFFAFAFAF);
const kDividerColor = Color(0xFFBDBDBD);
const kSecoundryTextColor = Color(0xFF757575);

BoxDecoration boxDecoration(BuildContext context) => BoxDecoration(
      color: UiUtils.getWhiteColorWithBrightness(context),
      borderRadius: BorderRadius.circular(10),
      boxShadow: boxShadow,
    );
final boxShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 7,
    spreadRadius: 1,
  )
];

class AppSizes {
  AppSizes(BuildContext _context) {
    this._context = _context;
    final _queryData = MediaQuery.of(this._context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height -
        ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  late BuildContext _context;
  late double _height;
  late double _width;
  late double _heightPadding;
  late double _widthPadding;

  double appHeight(double v) {
    return _height * v;
  }

  double appWidth(double v) {
    return _width * v;
  }

  double appVerticalPadding(double v) {
    return _heightPadding * v;
  }

  double appHorizontalPadding(double v) {
    return _widthPadding * v;
  }
}

extension MaterialColorCreator on Color {
  MaterialColor createMaterialColor() {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = red;
    final int g = green;
    final int b = blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(value, swatch);
  }
}
