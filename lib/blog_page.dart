import 'package:flutter/material.dart';
import '../main.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text('Blog Page')),
    );
  }
}