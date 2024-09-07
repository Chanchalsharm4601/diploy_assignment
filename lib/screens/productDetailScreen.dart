import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_provider.dart';
import '../model/product.dart';
import 'CartScreen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple[600]),
        title: Text(
          product.name,
          style: TextStyle(
            color: Colors.deepPurple[600],
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.deepPurple[600]),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()), // Navigate to CartScreen
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: product.image,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      product.image,
                      height: 300,
                      fit: BoxFit.cover, // Display product image
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[600],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Rs ${product.price}',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.pink[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.grey), // Divider between sections
              const SizedBox(height: 20),
              const Text(
                'Product Description',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'This is a beautiful product that you would love to have in your collection. It’s crafted with the finest materials and attention to detail, ensuring both style and comfort.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[600],
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).addToCart(product); // Add product to cart
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.name} added to cart'),
                          backgroundColor: Colors.deepPurple[600],
                          behavior: SnackBarBehavior.floating,
                        ),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()), // Navigate to CartScreen after adding
                      );
                    },
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
