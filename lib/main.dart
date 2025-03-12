import 'package:flutter/material.dart';
import 'package:flutter_application_app/main_layout.dart';

void main() {
  runApp(LiquorStoreApp());
}

class LiquorStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liquor Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Spectral',
      ),
      home: MainLayout(),
    );
  }
}