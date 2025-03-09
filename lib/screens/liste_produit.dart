// import 'package:atelier04/const/const.dart';
// import 'package:flutter/material.dart';
// import 'package:atelier04/model/produit.dart';

// class ListeProduitScreen extends StatefulWidget {
//   const ListeProduitScreen({super.key});

//   @override
//   State<ListeProduitScreen> createState() => _ListeProduitScreenState();
// }

// class _ListeProduitScreenState extends State<ListeProduitScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Liste Produit', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.pinkAccent,
//         elevation: 4,
//         centerTitle: true,
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(10),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.65, // Reduced further to make cards taller
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: Const.produits.length,
//         itemBuilder: (context, index) {
//           final product = Const.produits[index];
          
//           return Card(
//             elevation: 3,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Image Section
//                 Container(
//                   height: 150, // Keeping the larger image height
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                     ),
//                     image: DecorationImage(
//                       image: AssetImage(product.imageUrl),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 // Content Section - Added constraints to ensure content fits
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly, // More even spacing
//                       children: [
//                         // Product Name
//                         Text(
//                           product.title,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                           maxLines: 1, // Reduced from 2 to save space
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 2), // Reduced spacing
//                         // Description
//                         Text(
//                           product.description.length > 25
//                               ? '${product.description.substring(0, 25)}...' // Shortened description
//                               : product.description,
//                           style: const TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 2), // Reduced spacing
//                         // Price
//                         Text(
//                           "${product.price} DA",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Colors.pinkAccent,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:atelier04/const/const.dart';
import 'package:atelier04/screens/details_produit.dart';
import 'package:flutter/material.dart';
import 'package:atelier04/model/produit.dart';

class ListeProduitScreen extends StatefulWidget {
  const ListeProduitScreen({super.key});

  @override
  State<ListeProduitScreen> createState() => _ListeProduitScreenState();
}

class _ListeProduitScreenState extends State<ListeProduitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste Produit', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
        elevation: 4,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: (Const.produits.length / 2).ceil(), // Calculate number of rows
        itemBuilder: (context, rowIndex) {
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First product in the row
                Expanded(
                  child: _buildProductCard(context, rowIndex * 2),
                ),
                const SizedBox(width: 15),
                // Second product in the row (if exists)
                Expanded(
                  child: rowIndex * 2 + 1 < Const.produits.length
                      ? _buildProductCard(context, rowIndex * 2 + 1)
                      : Container(), // Empty container if no second product
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Helper method to build a product card
  Widget _buildProductCard(BuildContext context, int index) {
    // Check if index is within bounds
    if (index >= Const.produits.length) {
      return Container();
    }
    
    final product = Const.produits[index];
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                product.imageUrl,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            // Product Details
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  // Description
                  Text(
                    product.description.length > 25
                        ? '${product.description.substring(0, 25)}...'
                        : product.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  // Price
                  Text(
                    "${product.price} DA",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}