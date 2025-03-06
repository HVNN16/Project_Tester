import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter_application_app/about_page.dart';
import 'package:flutter_application_app/blog_page.dart';
import 'package:flutter_application_app/cart_page.dart';
import 'package:flutter_application_app/checkout_page.dart';
import 'package:flutter_application_app/contact_page.dart';
import 'package:flutter_application_app/login_page.dart';
import 'package:flutter_application_app/products_page.dart';
import 'package:flutter_application_app/signup_page.dart';

void main() {
  runApp(LiquorStoreApp());
}

class LiquorStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquor Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Spectral',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/products': (context) => ProductsPage(),
        '/blog': (context) => BlogPage(),
        '/contact': (context) => ContactPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60); // Standard AppBar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      title: Text(
        'Liquor Store',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () => _showCartBottomSheet(context),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                child: Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ],
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
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              child: Text('View Cart'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String name, String price, String imagePath) {
    return ListTile(
      leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(name),
      subtitle: Text(price),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> liquorCategories = ['Brandy', 'Gin', 'Rum', 'Tequila', 'Vodka', 'Whiskey'];
  final List<Map<String, String>> testimonials = [
    {
      'name': 'Roger Scott',
      'position': 'Marketing Manager',
      'text': 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.',
      'image': 'images/person_1.jpg',
    },
    {
      'name': 'Roger Scott',
      'position': 'Marketing Manager',
      'text': 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.',
      'image': 'images/person_2.jpg',
    },
    {
      'name': 'Roger Scott',
      'position': 'Marketing Manager',
      'text': 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.',
      'image': 'images/person_3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              child: Text(
                'Liquor Store',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              leading: Icon(Icons.local_drink),
              title: Text('Products'),
              onTap: () => Navigator.pushNamed(context, '/products'),
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('Blog'),
              onTap: () => Navigator.pushNamed(context, '/blog'),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact'),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () => Navigator.pushNamed(context, '/login'),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Sign Up'),
              onTap: () => Navigator.pushNamed(context, '/signup'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg_2.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Good Drink for Good Moments',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/products'),
                    child: Text('Shop Now'),
                  ),
                ],
              ),
            ),

            // Intro Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildIntroCard(
                    icon: Icons.support_agent,
                    title: 'Online Support 24/7',
                    description: 'Support whenever you need it.',
                  ),
                  _buildIntroCard(
                    icon: Icons.money,
                    title: 'Money Back Guarantee',
                    description: 'Risk-free shopping.',
                  ),
                  _buildIntroCard(
                    icon: Icons.local_shipping,
                    title: 'Free Shipping & Return',
                    description: 'Hassle-free delivery.',
                  ),
                ],
              ),
            ),

            // Categories Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: liquorCategories.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('images/kind-${index + 1}.jpg', height: 80, fit: BoxFit.cover),
                            SizedBox(height: 8),
                            Text(liquorCategories[index], style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Testimonial Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg_4.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                ),
              ),
              child: Column(
                children: [
                  Text('Testimonials', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  carousel.CarouselSlider(
                    options: carousel.CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: testimonials.map((testimonial) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    testimonial['text']!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(testimonial['image']!),
                                        radius: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(testimonial['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text(testimonial['position']!, style: TextStyle(color: Colors.grey)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            // Blog Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recent Blog', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Image.asset('images/image_${index + 1}.jpg', width: 100, height: 100, fit: BoxFit.cover),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('23 April 2020', style: TextStyle(color: Colors.grey)),
                                    SizedBox(height: 5),
                                    Text(
                                      'The Recipe from a Winemaker’s Restaurant',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text('A small river named Duden flows...', style: TextStyle(fontSize: 14)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cart'),
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildIntroCard({required IconData icon, required String title, required String description}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(description, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}