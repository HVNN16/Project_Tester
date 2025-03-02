import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel; // Sử dụng alias cho carousel_slider

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> liquorCategories = [
    'Brandy',
    'Gin',
    'Rum',
    'Tequila',
    'Vodka',
    'Whiskey',
  ];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg_2.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Good Drink for Good Moments.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), backgroundColor: Colors.blue,
                          ),
                          child: Text('Shop Now', style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            side: BorderSide(color: Colors.white),
                          ),
                          child: Text('Read More', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Intro Section
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIntroCard(
                    icon: Icons.support_agent,
                    title: 'Online Support 24/7',
                    description: 'A small river named Duden flows by their place and supplies it with the necessary regelialia.',
                  ),
                  _buildIntroCard(
                    icon: Icons.money,
                    title: 'Money Back Guarantee',
                    description: 'A small river named Duden flows by their place and supplies it with the necessary regelialia.',
                  ),
                  _buildIntroCard(
                    icon: Icons.local_shipping,
                    title: 'Free Shipping & Return',
                    description: 'A small river named Duden flows by their place and supplies it with the necessary regelialia.',
                  ),
                ],
              ),
            ),

            // About Section
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/about.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Since 1905', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(height: 10),
                          Text(
                            'Desire Meets A New Taste',
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '115 Years of Experience In Business',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Liquor Categories
            Container(
              padding: EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: liquorCategories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/kind-${index + 1}.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(liquorCategories[index], style: TextStyle(fontSize: 18)),
                    ],
                  );
                },
              ),
            ),

            // Testimonial Section
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg_4.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text('Testimonial', style: TextStyle(fontSize: 16, color: Colors.white)),
                  SizedBox(height: 10),
                  Text('Happy Clients', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  carousel.CarouselSlider( // Sử dụng alias 'carousel'
                    options: carousel.CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: testimonials.map((testimonial) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.format_quote, size: 40),
                                SizedBox(height: 10),
                                Text(
                                  testimonial['text']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(testimonial['image']!),
                                      radius: 30,
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
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            // Blog Section
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text('Blog', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  SizedBox(height: 10),
                  Text('Recent Blog', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: List.generate(4, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/image_${index + 1}.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('23 April 2020', style: TextStyle(color: Colors.grey)),
                                    SizedBox(height: 10),
                                    Text(
                                      'The Recipe from a Winemaker’s Restaurant',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'A small river named Duden flows by their place and supplies it with the necessary regelialia.',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(height: 10),
                                    TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Continue'),
                                          Icon(Icons.arrow_right),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroCard({required IconData icon, required String title, required String description}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}