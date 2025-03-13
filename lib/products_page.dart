// import 'package:flutter/material.dart';
// import 'package:flutter_application_app/cart_page.dart';
// import 'package:flutter_application_app/services/cart_service.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ProductsPage extends StatefulWidget {
//   const ProductsPage({super.key});

//   @override
//   State<ProductsPage> createState() => _ProductsPageState();
// }

// class _ProductsPageState extends State<ProductsPage> {
//   late Future<List<Map<String, dynamic>>> futureProducts;
//   final CartService cartService = CartService();
//   // static const String baseUrl = 'https://nodejs-ck-x8q8.onrender.com';
//   static const String baseUrl = 'http://localhost:3000';


//   Future<List<Map<String, dynamic>>> fetchProducts() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/admin/api/products'));
//       if (response.statusCode == 200) {
//         return List<Map<String, dynamic>>.from(jsonDecode(response.body));
//       } else {
//         throw Exception('Failed to load products: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching products: $e');
//     }
//   }

//   void addToCart(String productId) async {
//     try {
//       await cartService.addToCart(productId, 1);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Product added to cart')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to add to cart: $e')),
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     futureProducts = fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Products'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CartPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: futureProducts,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               padding: EdgeInsets.all(16),
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final product = snapshot.data![index];
//                 String imageUrl = product['image'] ?? '';
//                 if (!imageUrl.startsWith('http')) {
//                   imageUrl = '$baseUrl/$imageUrl';
//                 }

//                 return Card(
//                   elevation: 2,
//                   margin: EdgeInsets.symmetric(vertical: 8),
//                   child: ListTile(
//                     leading: SizedBox(
//                       width: 60,
//                       height: 60,
//                       child: Image.network(
//                         imageUrl,
//                         fit: BoxFit.cover,
//                         loadingBuilder: (context, child, loadingProgress) {
//                           if (loadingProgress == null) return child;
//                           return Center(child: CircularProgressIndicator());
//                         },
//                         errorBuilder: (context, error, stackTrace) {
//                           return Container(
//                             color: Colors.grey[300],
//                             child: Icon(Icons.broken_image),
//                           );
//                         },
//                       ),
//                     ),
//                     title: Text(product['name'] ?? 'No name'),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(product['category'] ?? 'No category'),
//                         SizedBox(height: 4),
//                         Row(
//                           children: [
//                             if (product['originalPrice'] != null)
//                               Text(
//                                 '\$${product['originalPrice']}',
//                                 style: TextStyle(
//                                   decoration: TextDecoration.lineThrough,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             SizedBox(width: 8),
//                             Text(
//                               '\$${product['price'].toString()}',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     trailing: IconButton(
//                       icon: Icon(Icons.add_shopping_cart),
//                       onPressed: () => addToCart(product['_id']),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_app/cart_page.dart';
import 'package:flutter_application_app/product_detail_page.dart'; // Thêm import này
import 'package:flutter_application_app/services/cart_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Future<List<Map<String, dynamic>>> futureProducts;
  final CartService cartService = CartService();
  // static const String baseUrl = 'http://localhost:3000'; // Giữ nguyên hoặc thay đổi nếu cần
  static const String baseUrl = 'https://nodejs-ck-x8q8.onrender.com'; //accc


  Future<List<Map<String, dynamic>>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/admin/api/products'));
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  void addToCart(String productId) async {
    try {
      await cartService.addToCart(productId, 1);
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
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                String imageUrl = product['image'] ?? '';
                if (!imageUrl.startsWith('http')) {
                  imageUrl = '$baseUrl/$imageUrl';
                }

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image),
                          );
                        },
                      ),
                    ),
                    title: Text(product['name'] ?? 'No name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product['category'] ?? 'No category'),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            if (product['originalPrice'] != null)
                              Text(
                                '\$${product['originalPrice']}',
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                            const SizedBox(width: 8),
                            Text(
                              '\$${product['price'].toString()}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () => addToCart(product['_id']),
                    ),
                    onTap: () {
                      // Điều hướng đến trang chi tiết sản phẩm
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(productId: product['_id']),
                        ),
                      );
                    },
                  ),
                );
              },
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