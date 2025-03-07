import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      '_id': '1',
      'image': 'images/prod-1.jpg',
      'category': 'Brandy',
      'name': 'Bacardi 151',
      'price': 25.99,
      'originalPrice': 30.00,
      'sale': true,
    },
    {
      '_id': '2',
      'image': 'images/prod-2.jpg',
      'category': 'Whiskey',
      'name': 'Jim Beam Kentucky Straight',
      'price': 30.89,
      'originalPrice': null,
      'sale': false,
    },
    {
      '_id': '3',
      'image': 'images/prod-3.jpg',
      'category': 'Gin',
      'name': 'Citadelle',
      'price': 22.50,
      'originalPrice': null,
      'sale': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Image.asset(product['image'], width: 60, height: 60, fit: BoxFit.cover),
            title: Text(product['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product['category']),
                SizedBox(height: 4),
                Row(
                  children: [
                    if (product['originalPrice'] != null)
                      Text(
                        '\$${product['originalPrice']}',
                        style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
                      ),
                    SizedBox(width: 8),
                    Text('\$${product['price']}', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${product['name']} added to cart')));
              },
            ),
          ),
        );
      },
    );
  }
}