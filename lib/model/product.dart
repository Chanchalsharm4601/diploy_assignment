class Product {
  final String name;
  final double price;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.image,
  });

  // Convert a Product into a Map (which is converted to JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }

  // Convert JSON (Map) into a Product object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'].toDouble(), // Ensure it's a double
      image: json['image'],
    );
  }
}
