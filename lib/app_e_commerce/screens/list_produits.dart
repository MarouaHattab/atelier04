import 'package:flutter/material.dart';
import './../model/list_produits_data.dart';
import './../my_widget/widget_produit.dart';

class ListProduitsScreen extends StatelessWidget {
  ListProduitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des articles"),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Number of columns in the grid
        mainAxisSpacing: 4.0, // Vertical spacing between grid items
        crossAxisSpacing: 4.0, // Horizontal spacing between grid items
        childAspectRatio: 0.40, // Aspect ratio of each grid item
        children: List.generate(
          ListProduit().Produits.length, // Generate widgets for each product
          (index) {
            // Pass the product data to the WidgetProduit
            return WidgetProduit(produit: ListProduit().Produits[index]);
          },
        ),
      ),
    );
  }
}
