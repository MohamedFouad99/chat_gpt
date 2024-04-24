import 'package:flutter/material.dart';

// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024

//This is a class named 'MyThemeData' that defines a set of colors and two themes,
// one light and one dark, with specific color schemes and text styles. The color
// values are defined as static fields of the class, making them easily accessible
// without creating an instance of the class. The two themes are also static fields,
// with one representing a light theme and the other a dark theme. The light and
// dark themes are defined with specific color schemes and text styles, using
// the color values previously defined in the class. This code can be used to
// create a consistent and customizable theme for an application.

class MyThemeData {
  static Color colorWhite = const Color(0xFFFFFFFF);
  static Color colorBlack = const Color(0xFF202123);
  static Color colorLightBlack = const Color(0xFF343541);
  static Color colorPrimary = const Color(0xFF10A37F);
  static Color colorRed = const Color(0xFFDF1C1C);
  static Color colorGrey = const Color(0xFFFFFFFF).withOpacity(.2);
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme(
      primary: colorPrimary,
      onPrimary: colorWhite,
      secondary: colorWhite,
      onSecondary: colorLightBlack,
      background: colorWhite,
      onPrimaryContainer: colorWhite,
      error: colorRed,
      onError: colorRed,
      onSurface: colorWhite,
      surface: colorLightBlack,
      onBackground: colorWhite.withOpacity(.8),
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: colorWhite,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Raleway',
        fontStyle: FontStyle.normal,
        fontSize: 40,
        color: colorPrimary,
        fontWeight: FontWeight.w700,
        height: 1.0,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Raleway',
        fontStyle: FontStyle.normal,
        fontSize: 32,
        color: colorPrimary,
        fontWeight: FontWeight.w700,
        height: 1.0,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Raleway',
        fontStyle: FontStyle.normal,
        fontSize: 18,
        color: colorWhite,
        fontWeight: FontWeight.w500,
        height: 1.0,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Raleway',
        fontStyle: FontStyle.normal,
        fontSize: 16,
        color: colorLightBlack,
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme(
      primary: colorWhite,
      onPrimary: colorWhite,
      secondary: colorWhite,
      onSecondary: colorLightBlack,
      background: colorLightBlack,
      error: colorRed,
      onError: colorRed,
      onSurface: colorWhite,
      surface: colorLightBlack,
      onBackground: colorGrey,
      onPrimaryContainer: colorBlack,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: colorLightBlack,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Raleway',
        fontStyle: FontStyle.normal,
        fontSize: 40,
        color: colorWhite,
        fontWeight: FontWeight.w700,
        height: 1.0,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Raleway',
        fontStyle: FontStyle.normal,
        fontSize: 32,
        color: colorWhite,
        fontWeight: FontWeight.w700,
        height: 1.0,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Raleway',
        fontStyle: FontStyle.normal,
        fontSize: 18,
        color: colorWhite,
        fontWeight: FontWeight.w500,
        height: 1.0,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Raleway',
        fontStyle: FontStyle.normal,
        fontSize: 16,
        color: colorWhite,
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
    ),
  );
}
