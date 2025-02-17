import 'package:flutter/material.dart';

class BarNavigationScreen extends StatefulWidget {
  const BarNavigationScreen({super.key});

  @override
  State<BarNavigationScreen> createState() => _BarNavigationScreenState();
}

class _BarNavigationScreenState extends State<BarNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('nav page'),
      ),
      body: Text('nav bar'),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Liste Produit'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), label: 'Panier'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ]),
    );
  }
}
