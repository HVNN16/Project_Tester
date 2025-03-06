import 'package:flutter/material.dart';
import '../main.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text('Products Page')),
    );
  }
}