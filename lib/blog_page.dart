import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Blog',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: Image.asset('images/image_${index + 1}.jpg', width: 100, height: 100, fit: BoxFit.cover),
                title: Text('Blog Post ${index + 1}'),
                subtitle: Text('April 2020'),
              ),
            );
          },
        ),
      ],
    );
  }
}