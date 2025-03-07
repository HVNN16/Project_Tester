import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'About Us',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Since 1905, we have been providing the finest liquors. Our mission is to deliver quality and satisfaction.',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
        Text('Contact Us:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text('Email: info@liquorstore.com'),
        Text('Phone: +1-800-555-1234'),
      ],
    );
  }
}