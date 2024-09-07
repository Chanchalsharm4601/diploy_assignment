import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../model/product.dart';
import 'productDetailScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> MenClothing = [];
  List<Product> WomenClothing = [];
  List<Product> KidsClothing = [];

  @override
  void initState() {
    super.initState();
    loadProducts(); // Load product data on initialization
  }

  Future<void> loadProducts() async {
    try {
      final jsonData = await rootBundle.loadString('assets/product.json');
      final data = jsonDecode(jsonData);
      setState(() {
        MenClothing = (data["Men"] as List).map((i) => Product.fromJson(i)).toList();
        WomenClothing = (data["Women"] as List).map((i) => Product.fromJson(i)).toList();
        KidsClothing = (data["Kids"] as List).map((i) => Product.fromJson(i)).toList();
      });
    } catch (e) {
      print("Error loading asset: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Center(
          child: Text(
            "KartiFy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              fontFamily: 'Nerko One',
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductCategory("Men's Wear", MenClothing), // Men's category
              _buildProductCategory("Women's Wear", WomenClothing), // Women's category
              _buildProductCategory("Kids' Wear", KidsClothing), // Kids' category
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCategory(String title, List<Product> products) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[700],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 280, // Horizontal list of products
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(product: product), // Navigate to product detail
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.all(10),
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Hero(
                tag: product.image,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    product.image,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Rs ${product.price}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurpleAccent[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
