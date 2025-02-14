import 'package:flutter/material.dart';

class GlobalThemeData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);
  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static final Color discountGreen =  Color(0xff5FB567);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        colorScheme: colorScheme,
        highlightColor: Colors.transparent,
        focusColor: focusColor);
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF000000),

    primary:  Color.fromARGB(255, 224, 224, 224), //background color
    onPrimary: Colors.black,

    secondary: Color(0xff4BB7F3),
    onSecondary: Color(0xffffffff),

    tertiary: Color(0xff613EEA),
    onTertiary: Colors.white,

    error: Color(0xffFA3636),
    onError: Colors.white,

    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    surface: Color.fromARGB(255, 0, 0, 0), //background color
    onSurface: Colors.white,

    primary: Color(0xff424242), //accent color
    onPrimary: Colors.white,

    secondary: Color(0xff4BB7F3),
    onSecondary: Color(0xff000000),

    tertiary: Color(0xff613EEA),
    onTertiary: Colors.white,

    error: Color(0xffFA3636),
    onError: Colors.white,

    brightness: Brightness.dark,
  );
}
