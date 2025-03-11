
import 'package:atelier04/model/produit.dart';

class ListeProduit {
  // List of products
    static List<Produit> produits = [

 Produit(
      id: "samsung1",
      title: "Samsung Galaxy S23 Ultra",
      description: "Flagship smartphone with powerful camera and S Pen support. Features a 6.8-inch Dynamic AMOLED display and Snapdragon 8 Gen 2 processor.",
      price: 2000.99,
      imageUrl: "assets/img/samsung_s23_ultra.jpg",
      quantity: 15,
      marque: "Samsung",
      produitCategoryName: "Smartphones",
    ),
    
    Produit(
      id: "iphone1",
      title: "iPhone 14 Pro Max",
      description: "Apple's premium smartphone with A16 Bionic chip, 48MP camera system, and Dynamic Island. Features an always-on 6.7-inch Super Retina XDR display.",
      price: 5000.99,
      imageUrl: "assets/img/iphone_14_pro.jpg",
      quantity: 10,
      marque: "Apple",
      produitCategoryName: "Smartphones",
    ),
    
    Produit(
      id: "huawei1",
      title: "Huawei P50 Pro",
      description: "Premium smartphone with Leica quad camera system, 6.6-inch OLED display, and Snapdragon 888 processor. Features 66W fast charging.",
      price: 899.99,
      imageUrl: "assets/img/huawei_p50.jpg",
      quantity: 8,
      marque: "Huawei",
      produitCategoryName: "Smartphones",
    ),
    
    Produit(
      id: "samsung2",
      title: "Samsung Galaxy Z Flip4",
      description: "Foldable smartphone with 6.7-inch Dynamic AMOLED display when unfolded. Features FlexCam, Snapdragon 8+ Gen 1 processor, and improved battery life.",
      price: 999.99,
      imageUrl: "assets/img/samsung_zflip4.jpg",
      quantity: 7,
      marque: "Samsung",
      produitCategoryName: "Smartphones",
    ),
    
    Produit(
      id: "google1",
      title: "Google Pixel 7 Pro",
      description: "Google's flagship phone with advanced camera features, Google Tensor G2 chip, and 6.7-inch LTPO display with 120Hz refresh rate.",
      price: 899.00,
      imageUrl: "assets/img/pixel_7_pro.png",
      quantity: 12,
      marque: "Google",
      produitCategoryName: "Smartphones",
    ),
  ];

}
