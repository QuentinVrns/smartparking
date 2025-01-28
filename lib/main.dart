import 'package:flutter/material.dart';
import 'pages/SplashScreenPage.dart'; // Importez la page SplashScreenPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Parking',
      home: SplashScreenPage(), // Lancer la SplashScreenPage
    );
  }
}
