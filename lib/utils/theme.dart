import 'package:flutter/material.dart';

class Colores {

  const Colores();

  static const Color appBarTitle = Colors.white;
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0xFF010440);
  //static const Color appBarBackground = const Color(0xFF080E33);
  static const Color appBarBackground = const Color(0xFF0B0D24);
  static const Color appBarGradientStart = const Color(0xFF1E3350);
  //static const Color appBarGradientStart = const Color(0xFF1F1F27);
  static const Color appBarGradientEnd = const Color(0xFF102037);

}

class TextStyles {

  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontSize: 24.0,
  );

  static const TextStyle DetailText = const TextStyle(
    fontWeight: FontWeight.normal,
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontSize: 18.0,
  );

  static const TextStyle NotasText = const TextStyle(
    fontWeight: FontWeight.w100,
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );

  static const TextStyle DetailTextLogin = const TextStyle(
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontStyle: FontStyle.normal,
    fontSize: 18.0,
  );

  static const TextStyle TextLoginButton = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontSize: 22.0,
  );

  static const TextStyle LabelText = const TextStyle(
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontSize: 20.0,
  );

  static const TextStyle ButtonText = const TextStyle(
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontSize: 18.0,
  );

}