import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:chessd_up/config/theme.dart';
import 'package:chessd_up/config/constants.dart';
import 'package:chessd_up/features/auth/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
