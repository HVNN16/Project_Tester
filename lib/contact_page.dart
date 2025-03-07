import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Contact Us',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text('Email: info@liquorstore.com'),
        Text('Phone: +1-800-555-1234'),
        Text('Address: 123 Liquor Lane, Alcohol City'),
      ],
    );
  }
}