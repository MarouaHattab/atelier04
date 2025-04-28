import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../model/class_produit.dart';
import './../provider/cart_provider.dart';

class ProduitDetailScreen extends StatefulWidget {
  const ProduitDetailScreen({super.key});
  
  @override
  State<ProduitDetailScreen> createState() => _ProduitDetailScreenState();
}

class _ProduitDetailScreenState extends State<ProduitDetailScreen> {
  // Fetching the product data passed from the previous screen using ModalRoute
  @override
  Widget build(BuildContext context) {
    // Getting the passed product data from the Navigator arguments
    Produit p = ModalRoute.of(context)!.settings.arguments as Produit;

    return Scaffold(
      // AppBar with product ID as the title
      appBar: AppBar(
        title: Text(p.id.toString()),
      ),
      body: Stack(
        children: [
          // Background image of the product
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black12), // Adds a slight overlay to the image
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(p.imageUrl), // Product image displayed here
          ),
          
          // Scrollable content for product details
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top: 16, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Adds space for the image at the top
                const SizedBox(
                  height: 250.0,
                ),
                // Product description and price
                Container(
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          p.description,  // Displays the product description
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        p.price.toString(),  // Displays the product price
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      const Divider(),
                      // Another section with product details
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          p.description, // Display the product description again
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(),
                      // Displays brand, quantity, and category of the product
                      infoProduct("Brand", p.brand),
                      infoProduct("Quantity", p.quantity.toString()),
                      infoProduct("Category", p.produitCategoryName),
                    ],
                  ),
                ),
                // Section for displaying product reviews
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: const Column(
                    children: [
                      Text(
                        "Aucun Review",  // No reviews yet
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 21),
                      ),
                      Text(
                        "Be the first to review ...",  // Encouraging the user to review
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                // Buttons for cart actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Button to add the product to the cart
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // Adding the product to the cart provider
                          Provider.of<PanierProvider>(context, listen: false)
                              .ajouterProduit(p.id, p.price, p.title,
                                  p.description, p.imageUrl);
                          // Show a snack bar confirming the action
                          showSnackBarMessage(
                              context, "Produit Ajouté dans le panier");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,  // Button color
                          foregroundColor: Colors.white, // Text color
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        child: const Text("Add to Cart"),
                      ),
                    ),
                    // "Buy Now" button
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text("Buy Now"),
                        icon: const Icon(Icons.credit_card),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                      ),
                    ),
                    // "Add to Favorites" button
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          print("ee");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        child: Icon(Icons.favorite),  // Heart icon for favorites
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Show a snack bar message for confirmation
  showSnackBarMessage(BuildContext context, String message) {
    var _snackBar = SnackBar(
      content: Text(
        message.toString(),
      ),
      duration: Duration(seconds: 3),  // Snack bar duration
      backgroundColor: Colors.green[400],
      action: SnackBarAction(label: "ok", onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }

  // Helper method to display product info (like brand, quantity, etc.)
  Widget infoProduct(String name, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Text(
            "$name:",  // Product attribute name
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            value,  // Product attribute value
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
