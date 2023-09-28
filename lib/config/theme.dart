import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Colors.white,
    primaryColorDark: Color(0xFF001F3F),
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Color(0xFFC4C4C4),
    fontFamily: "Poppins",
    textTheme: TextTheme(
      displayLarge: TextStyle(
          color: Color(0xFF121212), fontSize: 30, fontWeight: FontWeight.w700),
      displayMedium: TextStyle(
          color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.w700),
      displaySmall: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
    ),
  );
}
