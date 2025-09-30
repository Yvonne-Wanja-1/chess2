import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChessdUpTheme {
  // Custom color scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF2D3047), // Deep Navy
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFE6E8FF),
    onPrimaryContainer: Color(0xFF2D3047),
    secondary: Color(0xFF9E7B9B), // Dusty Rose
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFFFD8ED),
    onSecondaryContainer: Color(0xFF3B2837),
    tertiary: Color(0xFFAD8A64), // Warm Gold
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFFFFDCC1),
    onTertiaryContainer: Color(0xFF3B2837),
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
    primary: Color(0xFF9BA4FF), // Soft Blue
    onPrimary: Color(0xFF2D3047),
    primaryContainer: Color(0xFF444869),
    onPrimaryContainer: Color(0xFFE6E8FF),
    secondary: Color(0xFFE8B7D7), // Light Pink
    onSecondary: Color(0xFF5B3B57),
    secondaryContainer: Color(0xFF744B70),
    onSecondaryContainer: Color(0xFFFFD8ED),
    tertiary: Color(0xFFDFBC94), // Soft Gold
    onTertiary: Color(0xFF422B06),
    tertiaryContainer: Color(0xFF5D401B),
    onTertiaryContainer: Color(0xFFFFDCC1),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFB4AB),
    background: Color(0xFF1A1C1E), // Dark Gray
    onBackground: Color(0xFFE3E2E6),
    surface: Color(0xFF1A1C1E),
    onSurface: Color(0xFFE3E2E6),
    surfaceVariant: Color(0xFF49454F),
    onSurfaceVariant: Color(0xFFCAC4D0),
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
