import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  ThemeData theme(TextTheme textTheme) {
    return ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(textTheme),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }

}