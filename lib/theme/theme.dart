import 'package:flutter/material.dart';

const String fontFamily = 'IndieFlower-Regular';

ThemeData myTheme = ThemeData(
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff6750A4),
    onPrimary: Color(0xffFFFFFF),
    secondary: Color(0xff625B71),
    onSecondary: Color(0xffFFFFFF),
    background: Color(0xffFFFBFE),
    onBackground: Color(0xff1C1B1F),
    surface: Color(0xffFFFBFE),
    onSurface: Color(0xff1C1B1F),
    error: Color(0xffB3261E),
    onError: Color(0xffFFFFFF),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return const Color(0xff625B71);
          }
          return null;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return const Color(0xffFFFFFF);
          }
          return null;
        },
      ),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(20.0)),
      textStyle: const MaterialStatePropertyAll(TextStyle(
        fontFamily: fontFamily,
        fontSize: 25,
      )),
    ),
  ),
);
