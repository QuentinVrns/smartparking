import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends StatelessWidget {
  Future<void> requestPermission(BuildContext context) async {
    var status = await Permission.location.request();

    if (status.isGranted) {
      // Redirige vers la page principale via les routes nommées
      Navigator.pushReplacementNamed(context, '/home');
    } else if (status.isDenied) {
      // Affiche une bannière en bas de l'écran
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Permission refusée. Veuillez accepter pour utiliser l'application.",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 3), // Durée de la bannière
        ),
      );
    } else if (status.isPermanentlyDenied) {
      // Affiche une bannière pour encourager à ouvrir les paramètres
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Permission définitivement refusée. Ouvrez les paramètres pour l'activer.",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.orangeAccent,
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: 'Paramètres',
            onPressed: () {
              openAppSettings(); // Ouvre les paramètres
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consentement des permissions")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenue dans l'application SMART PARKING.\nAvant de continuer, veuillez accepter les permissions.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => requestPermission(context),
              child: Text("Accepter les permissions"),
            ),
          ],
        ),
      ),
    );
  }
}
