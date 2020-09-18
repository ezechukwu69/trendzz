import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color mainContrastColor = Colors.white;
TextStyle darkTextStyle = GoogleFonts.acme(color: Colors.white,);
TextStyle lightTextStyle = GoogleFonts.acme(color: Colors.black,);
TextTheme darkAppBarTextStyle = TextTheme(
  bodyText1: darkTextStyle,
  bodyText2: darkTextStyle,
  caption: darkTextStyle,
  button: darkTextStyle,
  headline1: darkTextStyle,
  headline2: darkTextStyle,
  headline3: darkTextStyle,
  headline4: darkTextStyle,
  headline5: darkTextStyle,
  headline6: darkTextStyle,
  subtitle1: darkTextStyle,
  subtitle2: darkTextStyle,
);
TextTheme lightAppBarTextStyle = TextTheme(
  bodyText1: lightTextStyle,
  bodyText2: lightTextStyle,
  caption: lightTextStyle,
  button: lightTextStyle,
  headline1: lightTextStyle,
  headline2: lightTextStyle,
  headline3: lightTextStyle,
  headline4: lightTextStyle,
  headline5: lightTextStyle,
  headline6: lightTextStyle,
  subtitle1: lightTextStyle,
  subtitle2: lightTextStyle,
);

ThemeData darkTheme = ThemeData(
      cardTheme: CardTheme(
        color: Color(0xff7d0633),
      ),
      appBarTheme: AppBarTheme(
        textTheme: darkAppBarTextStyle,
        color: Colors.transparent,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: Color(0xFF222831),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF07031a),
        selectedItemColor: mainContrastColor,
        unselectedItemColor: Colors.white12,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: darkAppBarTextStyle);

ThemeData lightTheme = ThemeData(
    cardTheme: CardTheme(
      color: Color(0xfffaf3dd),
    ),
    appBarTheme: AppBarTheme(
      textTheme: darkAppBarTextStyle,
      color: Colors.transparent,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Color(0xFFf5f1da),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFf5f1da),
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.indigo[200],
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: lightAppBarTextStyle);
