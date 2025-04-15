import 'package:atelier04/provider/cart_provider.dart';
import 'package:atelier04/screens/ban_navigation.dart';
import 'package:atelier04/screens/home.dart';
import 'package:atelier04/screens/liste_produit.dart';
import 'package:atelier04/screens/panier.dart';
import 'package:atelier04/screens/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
   runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PanierProvider())
      ],
      child: Ecommerce(),
    ),
  );
}
class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home':(context) => HomePageScreen(),
        '/listproduit':(context) => ListeProduitScreen(),
        '/panier':(context) => PanierScreen(),
        '/profiluser':(context) => UserInfoScreen(),

      },
      home :
    BarNavigationScreen(),
    debugShowCheckedModeBanner: false, );
  }
}
