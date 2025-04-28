import 'package:atelier04/model/class_produit_panier.dart';
import 'package:flutter/material.dart';

// Importation de la classe ProduitPanier et du package Flutter.
import 'package:atelier04/model/class_produit_panier.dart';
import 'package:flutter/material.dart';

// La classe PanierProvider étend ChangeNotifier pour notifier les listeners (UI) lorsque le panier change.
class PanierProvider with ChangeNotifier {
  // La liste _panier contient les objets ProduitPanier, qui représentent les produits dans le panier.
  List<ProduitPanier> _panier = [];

  // Getter pour accéder à la liste _panier depuis l'extérieur de la classe.
  List<ProduitPanier> get Panier {
    return _panier;
  }

  // La méthode ajouterProduit permet d'ajouter un produit au panier.
  void ajouterProduit(String productId, double price, String title,
      String description, String imageUrl) {
    
    // Recherche du produit dans le panier. Si le produit est déjà dans le panier, sa quantité est augmentée de 1.
    ProduitPanier? produitTrouve = _panier.firstWhere(
      (art) {
        // Si le produit est trouvé (son id correspond à celui passé en argument),
        // sa quantité (quantite) est augmentée de 1.
        if (art.id == productId) {
          art.quantite += 1; // Augmentation de la quantité du produit
          return true; // Le produit a été trouvé, on le retourne avec sa quantité mise à jour.
        }
        return false; // Le produit n'a pas été trouvé.
      },
      // Si aucun produit n'est trouvé (c'est-à-dire que le panier ne contient pas encore ce produit),
      // on ajoute un nouveau produit avec une quantité initiale de 1.
      orElse: () {
        print("Ajout new produit :$productId"); // Message dans la console pour indiquer qu'un nouveau produit est ajouté
        final nouveauProduit = ProduitPanier(
          id: productId, // ID du produit
          title: title,   // Titre du produit
          description: description, // Description du produit
          price: price,   // Prix du produit
          imageUrl: imageUrl, // URL de l'image du produit
          quantite: 1, // Quantité initiale du produit est 1
        );
        // Ajout du nouveau produit à la liste _panier
        _panier.add(nouveauProduit);
        return nouveauProduit; // Retourne le produit ajouté
      },
    );

    // Après avoir modifié le panier, on appelle notifyListeners() pour notifier tous les listeners
    // (par exemple, l'interface utilisateur) que l'état du panier a changé, et qu'ils doivent se mettre à jour.
    notifyListeners();
  }
}
