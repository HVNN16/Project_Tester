import 'package:flutter/material.dart';
import 'package:flutter_application_app/models/cart.dart';
import 'package:flutter_application_app/services/cart_service.dart';

class CartPage extends StatefulWidget {
  final VoidCallback? onCartUpdated; // Thay required bằng nullable
  const CartPage({Key? key, this.onCartUpdated}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<Cart> futureCart;
  final CartService cartService = CartService();

  @override
  void initState() {
    super.initState();
    futureCart = cartService.getCart();
  }

  void refreshCart() {
    setState(() {
      futureCart = cartService.getCart();
    });
    // Gọi onCartUpdated nếu nó không null
    widget.onCartUpdated?.call();
  }

  void updateQuantity(String productId, int newQuantity) async {
    try {
      await cartService.updateQuantity(productId, newQuantity);
      refreshCart();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update quantity: $e')),
      );
    }
  }

  void removeFromCart(String productId) async {
    try {
      await cartService.removeFromCart(productId);
      refreshCart();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product removed from cart')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to remove from cart: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: FutureBuilder<Cart>(
        future: futureCart,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final cart = snapshot.data!;
            print('Cart items: ${cart.items.map((item) => item.name).join(', ')}');
            return ListView(
              padding: EdgeInsets.all(16),
              children: [
                Text(
                  'Your Cart',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                if (cart.items.isEmpty)
                  Center(child: Text('Your cart is empty')),
                ...cart.items.map((item) {
                  print('Image URL for ${item.name}: ${item.image}');
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(
                          item.image,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) {
                            print('Error loading image for ${item.name}: $error');
                            return Image.asset(
                              'assets/placeholder.jpg',
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            );
                          },
                        ),
                      ),
                      title: Text(item.name),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$${item.price.toStringAsFixed(2)}'),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: item.quantity > 1
                                    ? () => updateQuantity(item.productId, item.quantity - 1)
                                    : null,
                              ),
                              Text('${item.quantity}'),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => updateQuantity(item.productId, item.quantity + 1),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => removeFromCart(item.productId),
                      ),
                    ),
                  );
                }).toList(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: cart.items.isEmpty
                      ? null
                      : () => Navigator.pushNamed(context, '/checkout'),
                  child: Text('Checkout'),
                ),
                SizedBox(height: 10),
                Text(
                  'Subtotal: \$${cart.subtotal.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }
          return Center(child: Text('No data'));
        },
      ),
    );
  }
}