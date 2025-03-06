import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;

class AboutPage extends StatelessWidget {
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
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('About Us', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg_2.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/'),
                        child: Text('Home', style: TextStyle(color: Colors.white)),
                      ),
                      Icon(Icons.chevron_right, color: Colors.white, size: 16),
                      Text('About Us', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 20),
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
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/about.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Since 1905', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        SizedBox(height: 8),
                        Text(
                          'Desire Meets A New Taste',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times.',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              '115',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Years of', style: TextStyle(fontSize: 14)),
                                Text('Experience', style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
                  Text('Our Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                  Text('Happy Clients', style: TextStyle(fontSize: 16, color: Colors.white)),
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
                                  Icon(Icons.format_quote, size: 24),
                                  SizedBox(height: 8),
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

            // Counter Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildCounterCard('3000', 'Satisfied Customers'),
                  _buildCounterCard('115', 'Years of Experience'),
                  _buildCounterCard('100', 'Kinds of Liquor'),
                  _buildCounterCard('40', 'Our Branches'),
                ],
              ),
            ),
          ],
        ),
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

  Widget _buildCounterCard(String number, String label) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Text(label, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}