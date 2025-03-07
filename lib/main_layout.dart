import 'package:flutter/material.dart';
import 'package:flutter_application_app/custom_app_bar.dart';
import 'package:flutter_application_app/home_page.dart';
import 'package:flutter_application_app/products_page.dart';
import 'package:flutter_application_app/about_page.dart';
import 'package:flutter_application_app/blog_page.dart';
import 'package:flutter_application_app/contact_page.dart';
import 'package:flutter_application_app/cart_page.dart';
import 'package:flutter_application_app/checkout_page.dart';
import 'package:flutter_application_app/login_page.dart';
import 'package:flutter_application_app/signup_page.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    HomePage(),
    ProductsPage(),
    AboutPage(),
    BlogPage(),
    ContactPage(),
    CartPage(),
    CheckoutPage(),
    LoginPage(),
    SignupPage(),
  ];

  static const List<String> _titles = [
    'Home',
    'Products',
    'About',
    'Blog',
    'Contact',
    'Cart',
    'Checkout',
    'Login',
    'Sign Up',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _titles[_selectedIndex],
        onCartPressed: () => _showCartBottomSheet(context),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_drink), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Blog'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Contact'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Checkout'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.person_add), label: 'Sign Up'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Liquor Store',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Navigation',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.local_drink),
              title: Text('Products'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('Blog'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(4);
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(7);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Sign Up'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(8);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(5);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCartBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        height: 300,
        child: Column(
          children: [
            Text('Your Cart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                children: [
                  _buildCartItem('Bacardi 151', '\$25.99', 'images/prod-1.jpg'),
                  _buildCartItem('Jim Beam Kentucky Straight', '\$30.89', 'images/prod-2.jpg'),
                  _buildCartItem('Citadelle', '\$22.50', 'images/prod-3.jpg'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _onItemTapped(5);
              },
              child: Text('View Cart'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String name, String price, String imagePath) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.broken_image, size: 50);
        },
      ),
      title: Text(name),
      subtitle: Text(price),
    );
  }
}