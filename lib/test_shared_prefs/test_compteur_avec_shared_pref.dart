import 'package:flutter/material.dart';
// Import de la librairie SharedPreferences pour stocker des données localement
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

// Application principale
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// État de l'application
class _MyAppState extends State<MyApp> {
  int _cpt = 0; // compteur principal
  int? tmp = 0; // variable temporaire (non utilisée ici)

  // Fonction pour sauvegarder le compteur dans SharedPreferences
  Future saveData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt("compteur", _cpt); // Enregistrer la valeur du compteur avec la clé "compteur"
  }

  // Fonction pour charger la valeur enregistrée du compteur
  Future<void> chargerData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      _cpt = _prefs.getInt("compteur") ?? 0; 
      // Si la valeur n'existe pas (null), on initialise à 0
    });
  }

  // Fonction pour réinitialiser le compteur (supprimer de SharedPreferences)
  Future reset() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove("compteur"); // Supprimer la clé "compteur"
    setState(() {
      _cpt = 0; // Remettre le compteur à 0
    });
  }

  @override
  void initState() {
    super.initState();
    chargerData(); // Charger la valeur enregistrée au démarrage de l'app
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Test Compteur avec SH_pref"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Valeur Compteur"),
            Text(_cpt.toString()), // Afficher la valeur actuelle du compteur
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _cpt += 1; // Incrémenter compteur
                });
                saveData(); // Sauvegarder la nouvelle valeur
              },
              child: Text("Incrémenter"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _cpt -= 1; // Décrémenter compteur
                });
                saveData(); // Sauvegarder la nouvelle valeur
              },
              child: Text("Décrémenter"),
            ),
            ElevatedButton(
              onPressed: () {
                reset(); // Réinitialiser le compteur
              },
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}

/*
------------------------------------------------------------------------------------------------
Explication rapide sur SharedPreferences :

SharedPreferences est un mécanisme pour enregistrer des petites données **localement** sur l'appareil, 
de façon **persistante** (elles restent même après avoir fermé l'application).
Il est souvent utilisé pour enregistrer :
- le nom d'utilisateur
- les préférences d'une application
- des tokens d'authentification
- etc.

SharedPreferences stocke uniquement des **types simples** : String, int, double, bool, List<String>.

------------------------------------------------------------------------------------------------
III. Les méthodes disponibles avec SharedPreferences :

a. String :
   - Sauvegarde :
      await prefs.setString('nom_Cle', 'Valeur texte');
      await prefs.setString('user', 'admin');
   - Récupération :
      String? valeur = prefs.getString('maCle');
      // Retourne `null` si la clé n'existe pas

b. Int :
   - Sauvegarde :
      await prefs.setInt('age', 25);
   - Récupération :
      int? age = prefs.getInt('age');
      // Retourne `null` si la clé n'existe pas

c. bool :
   - Sauvegarde :
      await prefs.setBool('estConnecte', true);
   - Récupération :
      bool? estConnecte = prefs.getBool('estConnecte');
      // Retourne `null` si la clé n'existe pas

d. double (Nombre décimal) :
   - Sauvegarde :
      await prefs.setDouble('prix', 9.99);
   - Récupération :
      double? prix = prefs.getDouble('prix');

e. List<String> (Liste de chaînes) :
   - Sauvegarde :
      await prefs.setStringList('fruits', ['Pomme', 'Banane']);
   - Récupération :
      List<String>? fruits = prefs.getStringList('fruits');

f. Vérifier si une clé existe :
   - bool existe = prefs.containsKey('maCle');

g. Supprimer une clé :
   - await prefs.remove('maCle');

h. Tout effacer (toutes les clés) :
   - await prefs.clear();
------------------------------------------------------------------------------------------------
*/
