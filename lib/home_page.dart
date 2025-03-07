import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> liquorCategories = ['Brandy', 'Gin', 'Rum', 'Tequila', 'Vodka', 'Whiskey'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Welcome to Liquor Store',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
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
    );
  }
}