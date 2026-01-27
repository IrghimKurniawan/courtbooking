import 'package:flutter/material.dart';
import 'package:court/login.dart';
import 'package:court/register.dart';
import 'package:court/started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // DEFAULT PAGE
      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const CourtApp(),
      },
    );
  }
}
