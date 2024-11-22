import 'dart:io'; // Add this import for SSL bypass

import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/trivia_screen.dart';
import 'screens/trivia_screen2.dart';
import 'screens/trivia_screen3.dart';
import 'screens/trivia_screen4.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides(); // Bypass SSL for image loading
  runApp(const Formula1TriviaApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Formula1TriviaApp extends StatelessWidget {
  const Formula1TriviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formula 1 Trivia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.red.shade900,
          secondary: Colors.black,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade900,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            textStyle: const TextStyle(fontSize: 18.0),
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/createAccount': (context) => CreateAccountScreen(),
        '/welcome': (context) => WelcomeScreen(username: ''),
        '/level1': (context) => const TriviaScreen(),
        '/level2': (context) => TriviaScreen2(),
        '/level3': (context) => TriviaScreen3(),
        '/level4': (context) => TriviaScreen4(),
      },
    );
  }
}
