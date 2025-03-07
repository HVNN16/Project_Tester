import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Your Cart',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Image.asset('images/prod-1.jpg', width: 50, height: 50, fit: BoxFit.cover),
          title: Text('Bacardi 151'),
          subtitle: Text('\$25.99'),
          trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {}),
        ),
        ListTile(
          leading: Image.asset('images/prod-2.jpg', width: 50, height: 50, fit: BoxFit.cover),
          title: Text('Jim Beam Kentucky Straight'),
          subtitle: Text('\$30.89'),
          trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {}),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/checkout'),
          child: Text('Checkout'),
        ),
      ],
    );
  }
}