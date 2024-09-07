import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    // Calculate the total price of items in the cart
    double totalPrice = cart.cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple[600]),
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.deepPurple[600],
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: cart.cartItems.isNotEmpty
          ? ListView.builder(
        itemCount: cart.cartItems.length,
        itemBuilder: (context, index) {
          final product = cart.cartItems[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[600],
                ),
              ),
              subtitle: Text(
                'Rs ${product.price}',
                style: TextStyle(
                  color: Colors.pink[400],
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.remove_shopping_cart, color: Colors.redAccent),
                onPressed: () {
                  cart.removeFromCart(product); // Remove item from cart
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} removed from cart'),
                      backgroundColor: Colors.redAccent,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
            ),
          );
        },
      )
          : Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[600],
          ),
        ),
      ),
      bottomNavigationBar: cart.cartItems.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display the total price
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Total: Rs $totalPrice',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[600],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[600],
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                shadowColor: Colors.deepPurple.withOpacity(0.5),
              ),
              onPressed: () {
                // Handle checkout action
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag, color: Colors.white), // Checkout icon
                  SizedBox(width: 10), // Space between icon and text
                  Text(
                    'Checkout (${cart.cartItems.length} items)',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
          : SizedBox.shrink(), // Empty space when cart is empty
    );
  }
}
