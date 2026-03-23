import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuroraTheme {
  // Light Mode Colors
  static const Color lightBg = Color(0xFFFBFBFE);
  static const Color primaryPurple = Color(0xFF6352E8);

  // Dark Mode Colors (Midnight Aurora)
  static const Color darkBg = Color(0xFF0A0A0C);
  static const Color darkSurface = Color(0xFF161618);

  static ThemeData get lightTheme => _theme(Brightness.light);
  static ThemeData get darkTheme => _theme(Brightness.dark);

  static ThemeData _theme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: isDark ? darkBg : lightBg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPurple,
        brightness: brightness,
        surface: isDark ? darkSurface : Colors.white,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.instrumentSerif(
          fontSize: 36, 
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black,
        ),
        titleLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}