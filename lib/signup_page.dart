import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Sign Up',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text('Email', style: TextStyle(fontSize: 16)),
        TextField(decoration: InputDecoration(hintText: 'Enter your email')),
        SizedBox(height: 10),
        Text('Password', style: TextStyle(fontSize: 16)),
        TextField(obscureText: true, decoration: InputDecoration(hintText: 'Enter your password')),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signed Up!')));
          },
          child: Text('Sign Up'),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/login'),
          child: Text('Already have an account? Login'),
        ),
      ],
    );
  }
}