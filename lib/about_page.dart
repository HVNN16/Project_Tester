import 'package:flutter/material.dart';
import '../main.dart'; // Import CustomAppBar from main.dart

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text('About Page')),
    );
  }
}