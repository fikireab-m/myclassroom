import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppTheme {
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color green = Color(0xFF14F8AC);
  static const Color skyBlue = Color(0xFF00AED9);
  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color blackColor = Color(0xFF000000);
  static TextTheme lightTextTheme = TextTheme(
      bodyText1: GoogleFonts.openSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        color: Color(0xFF000000),
      ),
      headline1: GoogleFonts.openSans(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF000000),
      ),
      headline2: GoogleFonts.openSans(
        fontSize: 21.0,
        fontWeight: FontWeight.w700,
        color: Color(0xFF000000),
      ),
      headline3: GoogleFonts.openSans(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Color(0xFF000000),
      ),
      headline6: GoogleFonts.openSans(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Color(0xFF000000),
      ));
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Color(0xFFFFFFFF),
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFFFFF),
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Color(0xFFFFFFFF),
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Color(0xFF000000);
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Color(0xFF000000),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFF000000),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFF14F8AC),
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF139E3E),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFF00AD73),
      ),
      textTheme: darkTextTheme,
    );
  }
}
