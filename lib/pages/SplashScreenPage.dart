import 'package:flutter/material.dart';
import 'PermissionPage.dart'; // Importer la page des permissions

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Redirection automatique après 20 secondes
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PermissionPage()),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/backgroundlogo.png', // Chemin vers votre image
              fit: BoxFit.cover, // Permet à l'image de remplir l'écran
            ),
          ),
        ],
      ),
    );
  }
}
