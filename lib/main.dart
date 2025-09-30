import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './config/theme.dart';
import './config/constants.dart';
import './features/auth/presentation/screens/splash_screen.dart';

void main() {
  runApp(const ChessdUpApp());
}

class ChessdUpApp extends StatelessWidget {
  const ChessdUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Add providers here
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        theme: ChessdUpTheme.lightTheme,
        darkTheme: ChessdUpTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
