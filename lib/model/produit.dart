class Produit {
  int id;
  String title;
  String description;
  double price;
  String imageUrl;
  int quantity;
  bool isFavorite = false;
  String marque;
  String produitCategoryName;
  Produit({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.marque,
    required this.produitCategoryName,
  });
  get getId => id;
  get getTitle => title;
  get getDescription => description;
  get getPrice => price;
  get getImageUrl => imageUrl;
  get getQuantity => quantity;
  get getFavorite => isFavorite;
  get getMarque => marque;
  get getProduitCategoryName => produitCategoryName;

  get category => null;
  set setQuantity(int quantity) => this.quantity = quantity;
  set setTitle(String title) => this.title = title;
  set setDescription(String description) => this.description = description;
  set setPrice(double price) => this.price = price;
  set setImageUrl(String imageUrl) => this.imageUrl = imageUrl;
  set setFavorite(bool isFavorite) => this.isFavorite = isFavorite;
  set setMarque(String marque) => this.marque = marque;
  set setProduitCategoryName(String produitCategoryName) =>
      this.produitCategoryName = produitCategoryName;
}
