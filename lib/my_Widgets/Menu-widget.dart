import 'package:atelier04/screens/home.dart';
import 'package:atelier04/screens/liste_produit.dart';
import 'package:atelier04/screens/panier.dart';
import 'package:atelier04/screens/user_info.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Maroua Hattab"),
            accountEmail: Text("maroua@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  NetworkImage("https://www.pngmart.com/image/319304"),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Accueil"),
            onTap: () {
             // Navigator.pushNamed(context, "/home");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePageScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("List de Produit"),
            onTap: () {
             //Navigator.pushNamed(context, "/listproduit");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListeProduitScreen()),
              );

            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("Panier"),
            onTap: () {
            //Navigator.pushNamed(context, "/panier");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PanierScreen()),
              );

            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profil"),
            onTap: () {
              // Navigator.pushNamed(context, "/profiluser");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserInfoScreen()),
              );
            },
          )
        ],
      ),
    );
  }
}
