import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_app/services/cart_service.dart'; // Import CartService

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  static const String baseUrl = 'http://localhost:3000'; // Hoặc URL của bạn
  late Future<Map<String, dynamic>> futureProduct;
  final CartService cartService = CartService(); // Khởi tạo CartService

  Future<Map<String, dynamic>> fetchProductDetail() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/admin/api/products/${widget.productId}'));
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load product: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }

  // Hàm để thêm sản phẩm vào giỏ hàng
  void addToCart(String productId) async {
    try {
      await cartService.addToCart(productId, 1); // Thêm sản phẩm với số lượng 1
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product added to cart')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add to cart: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProductDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureProduct,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final product = snapshot.data!;
            String imageUrl = product['image'] ?? '';
            if (!imageUrl.startsWith('http')) {
              imageUrl = '$baseUrl/$imageUrl';
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hình ảnh sản phẩm
                  Center(
                    child: Image.network(
                      imageUrl,
                      height: 300,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const CircularProgressIndicator();
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 300,
                          color: Colors.grey[300],
                          child: const Icon(Icons.broken_image, size: 50),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tên sản phẩm
                  Text(
                    product['name'] ?? 'No name',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Danh mục
                  Text(
                    product['category'] ?? 'No category',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  // Giá
                  Row(
                    children: [
                      if (product['originalPrice'] != null)
                        Text(
                          '\$${product['originalPrice']}',
                          style: const TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      const SizedBox(width: 8),
                      Text(
                        '\$${product['price'].toString()}',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Mô tả (nếu có)
                  if (product['description'] != null)
                    Text(
                      product['description'],
                      style: const TextStyle(fontSize: 16),
                    ),
                  const SizedBox(height: 16),
                  // Nút thêm vào giỏ hàng
                  ElevatedButton(
                    onPressed: () {
                      addToCart(widget.productId); // Gọi hàm addToCart với productId
                    },
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}