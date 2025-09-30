import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChessdUpTheme {
  // Custom color scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF2196F3), // Blue accent
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFBBDEFB),
    onPrimaryContainer: Color(0xFF0D47A1),
    secondary: Color(0xFF42A5F5), // Lighter Blue
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFE3F2FD),
    onSecondaryContainer: Color(0xFF1565C0),
    tertiary: Color(0xFF64B5F6), // Even Lighter Blue
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFFE1F5FE),
    onTertiaryContainer: Color(0xFF1976D2),
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFAFAFC), // Off White
    onBackground: Color(0xFF1A1C1E),
    surface: Color(0xFFFAFAFC),
    onSurface: Color(0xFF1A1C1E),
    surfaceVariant: Color(0xFFE7E0EC),
    onSurfaceVariant: Color(0xFF49454F),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF1976D2), // Strong Blue
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE3F2FD),
    onPrimaryContainer: Color(0xFF0D47A1),
    secondary: Color(0xFF1565C0), // Deep Blue
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE1F5FE),
    onSecondaryContainer: Color(0xFF0D47A1),
    tertiary: Color(0xFF0D47A1), // Darkest Blue
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFBBDEFB),
    onTertiaryContainer: Color(0xFF0D47A1),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFB4AB),
    background: Color(0xFFFAFAFA), // Light Gray-White
    onBackground: Color(0xFF1E2937),
    surface: Color(0xFFFFFFFF), // Pure White
    onSurface: Color(0xFF1E2937),
    surfaceVariant: Color(0xFFF0F0F0), // Light Gray
    onSurfaceVariant: Color(0xFF49454F),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: lightColorScheme.primary,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: lightColorScheme.primary,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: lightColorScheme.primary,
        ),
        bodyLarge: GoogleFonts.inter(color: lightColorScheme.onBackground),
        bodyMedium: GoogleFonts.inter(color: lightColorScheme.onBackground),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary,
      ),
      cardTheme: const CardThemeData(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: darkColorScheme.primary,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: darkColorScheme.primary,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: darkColorScheme.primary,
        ),
        bodyLarge: GoogleFonts.inter(color: darkColorScheme.onBackground),
        bodyMedium: GoogleFonts.inter(color: darkColorScheme.onBackground),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: darkColorScheme.primary,
        foregroundColor: darkColorScheme.onPrimary,
      ),
      cardTheme: const CardThemeData(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
