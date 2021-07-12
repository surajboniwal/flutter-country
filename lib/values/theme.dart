import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getTheme(context) {
    return ThemeData(
      primaryColor: Colors.blue,
      textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
