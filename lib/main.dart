import 'package:flutter/material.dart';
import 'package:flutter_application_app/main_layout.dart';
import 'package:flutter_application_app/login_page.dart';
import 'package:flutter_application_app/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liquor Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/main', // Bắt đầu từ MainLayout
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/main': (context) => MainLayout(),
      },
    );
  }
}