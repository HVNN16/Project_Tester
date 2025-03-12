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
import 'package:flutter_application_app/services/auth_service.dart';
import 'package:flutter_application_app/services/cart_service.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  int cartItemCount = 0;
  final CartService cartService = CartService();
  Map<String, dynamic>? _user;

  @override
  void initState() {
    super.initState();
    _loadCartCount();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = await AuthService.getCurrentUser();
    setState(() {
      _user = user;
    });
  }

  Future<void> _loadCartCount() async {
    try {
      final cart = await cartService.getCart();
      setState(() {
        cartItemCount = cart.items.fold(0, (sum, item) => sum + item.quantity);
      });
    } catch (e) {
      print('Error loading cart count: $e');
    }
  }

  void _updateCartCount() {
    _loadCartCount();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(onCartUpdated: _updateCartCount),
      ),
    );
  }

  Future<void> _logout() async {
    await AuthService.logout();
    setState(() {
      _user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: [
          'Home',
          'Products',
          'About',
          'Blog',
          'Contact',
          'Cart',
          'Checkout',
          'Login',
          'Sign Up',
        ][_selectedIndex],
        cartItemCount: cartItemCount,
        onCartPressed: _navigateToCart,
        user: _user,
        onLogout: _logout,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          ProductsPage(),
          AboutPage(),
          BlogPage(),
          ContactPage(),
          CartPage(onCartUpdated: _updateCartCount),
          CheckoutPage(),
          LoginPage(),
          SignupPage(),
        ],
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
            if (_user != null)
              ListTile(
                leading: Icon(Icons.person),
                title: Text(_user!['name']),
                onTap: () {},
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
            if (_user != null)
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () async {
                  await _logout();
                  Navigator.pop(context);
                },
              ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(onCartUpdated: _updateCartCount),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}