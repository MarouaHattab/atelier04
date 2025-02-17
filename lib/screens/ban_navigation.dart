import 'package:atelier04/screens/home.dart';
import 'package:atelier04/screens/liste_produit.dart';
import 'package:atelier04/screens/panier.dart';
import 'package:atelier04/screens/user_info.dart';
import 'package:flutter/material.dart';

class BarNavigationScreen extends StatefulWidget {
  const BarNavigationScreen({super.key});

  @override
  State<BarNavigationScreen> createState() => _BarNavigationScreenState();
}

class _BarNavigationScreenState extends State<BarNavigationScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomePageScreen(),
    ListeProduitScreen(),
    PanierScreen(),
    UserInfoScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageScreen(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.pinkAccent,
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Liste Produit'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Panier'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ]),
    );
  }
}
