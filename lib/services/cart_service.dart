import 'dart:convert';
import 'package:flutter_application_app/models/cart.dart';
import 'package:http/http.dart' as http;

class CartService {
  static const String baseUrl = 'http://localhost:3000';
    // static const String baseUrl = 'https://nodejs-ck-x8q8.onrender.com';

  Future<void> addToCart(String productId, int quantity) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/add-to-cart'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'productId': productId,
          'quantity': quantity,
        }),
      );

      print('Add to Cart Response: ${response.statusCode} - ${response.body}');
      if (response.statusCode != 200) {
        throw Exception('Failed to add to cart: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error adding to cart: $e');
    }
  }

  Future<Cart> getCart() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/cart')); // Sử dụng /api/cart
      print('Get Cart Response: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 200) {
        return Cart.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load cart: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Error fetching cart: $e');
    }
  }

  Future<void> updateQuantity(String productId, int quantity) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/update-quantity'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'productId': productId,
          'quantity': quantity,
        }),
      );

      print('Update Quantity Response: ${response.statusCode} - ${response.body}');
      if (response.statusCode != 200) {
        throw Exception('Failed to update quantity: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error updating quantity: $e');
    }
  }

  Future<Cart> removeFromCart(String productId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/remove-from-cart'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'productId': productId,
        }),
      );

      print('Remove from Cart Response: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 200) {
        return Cart.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to remove from cart: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error removing from cart: $e');
    }
  }
}