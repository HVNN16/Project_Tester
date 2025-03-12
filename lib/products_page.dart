// // import 'package:flutter/material.dart';

// // class ProductsPage extends StatelessWidget {
// //   final List<Map<String, dynamic>> products = [
// //     {
// //       '_id': '1',
// //       'image': 'images/prod-1.jpg',
// //       'category': 'Brandy',
// //       'name': 'Bacardi 151',
// //       'price': 25.99,
// //       'originalPrice': 30.00,
// //       'sale': true,
// //     },
// //     {
// //       '_id': '2',
// //       'image': 'images/prod-2.jpg',
// //       'category': 'Whiskey',
// //       'name': 'Jim Beam Kentucky Straight',
// //       'price': 30.89,
// //       'originalPrice': null,
// //       'sale': false,
// //     },
// //     {
// //       '_id': '3',
// //       'image': 'images/prod-3.jpg',
// //       'category': 'Gin',
// //       'name': 'Citadelle',
// //       'price': 22.50,
// //       'originalPrice': null,
// //       'sale': false,
// //     },
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       padding: EdgeInsets.all(16),
// //       itemCount: products.length,
// //       itemBuilder: (context, index) {
// //         final product = products[index];
// //         return Card(
// //           elevation: 2,
// //           margin: EdgeInsets.symmetric(vertical: 8),
// //           child: ListTile(
// //             leading: Image.asset(product['image'], width: 60, height: 60, fit: BoxFit.cover),
// //             title: Text(product['name']),
// //             subtitle: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(product['category']),
// //                 SizedBox(height: 4),
// //                 Row(
// //                   children: [
// //                     if (product['originalPrice'] != null)
// //                       Text(
// //                         '\$${product['originalPrice']}',
// //                         style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
// //                       ),
// //                     SizedBox(width: 8),
// //                     Text('\$${product['price']}', style: TextStyle(fontWeight: FontWeight.bold)),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //             trailing: IconButton(
// //               icon: Icon(Icons.add_shopping_cart),
// //               onPressed: () {
// //                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${product['name']} added to cart')));
// //               },
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ProductsPage extends StatefulWidget {
//   const ProductsPage({super.key});

//   @override
//   State<ProductsPage> createState() => _ProductsPageState();
// }

// class _ProductsPageState extends State<ProductsPage> {
//   late Future<List<Map<String, dynamic>>> futureProducts;
//   static const String baseUrl = 'https://nodejs-ck-x8q8.onrender.com';

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

//   @override
//   void initState() {
//     super.initState();
//     futureProducts = fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: futureProducts,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             padding: EdgeInsets.all(16),
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               final product = snapshot.data![index];
//               // Đảm bảo URL đầy đủ cho hình ảnh
//               String imageUrl = product['image'] ?? '';
//               if (!imageUrl.startsWith('http')) {
//                 imageUrl = '$baseUrl/$imageUrl';
//               }

//               return Card(
//                 elevation: 2,
//                 margin: EdgeInsets.symmetric(vertical: 8),
//                 child: ListTile(
//                   leading: SizedBox(
//                     width: 60,
//                     height: 60,
//                     child: Image.network(
//                       imageUrl,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) return child;
//                         return Center(child: CircularProgressIndicator());
//                       },
//                       errorBuilder: (context, error, stackTrace) {
//                         print('Error loading image: $error'); // Debug log
//                         return Container(
//                           color: Colors.grey[300],
//                           child: Icon(Icons.broken_image),
//                         );
//                       },
//                     ),
//                   ),
//                   title: Text(product['name'] ?? 'No name'),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(product['category'] ?? 'No category'),
//                       SizedBox(height: 4),
//                       Row(
//                         children: [
//                           if (product['originalPrice'] != null)
//                             Text(
//                               '\$${product['originalPrice']}',
//                               style: TextStyle(
//                                 decoration: TextDecoration.lineThrough,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           SizedBox(width: 8),
//                           Text(
//                             '\$${product['price'].toString()}',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   trailing: IconButton(
//                     icon: Icon(Icons.add_shopping_cart),
//                     onPressed: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('${product['name']} added to cart'),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }
//         return Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }

// products_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_app/cart_page.dart';
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
  static const String baseUrl = 'https://nodejs-ck-x8q8.onrender.com';

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
        SnackBar(content: Text('Product added to cart')),
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
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
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
              padding: EdgeInsets.all(16),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                String imageUrl = product['image'] ?? '';
                if (!imageUrl.startsWith('http')) {
                  imageUrl = '$baseUrl/$imageUrl';
                }

                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Icon(Icons.broken_image),
                          );
                        },
                      ),
                    ),
                    title: Text(product['name'] ?? 'No name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product['category'] ?? 'No category'),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            if (product['originalPrice'] != null)
                              Text(
                                '\$${product['originalPrice']}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                            SizedBox(width: 8),
                            Text(
                              '\$${product['price'].toString()}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () => addToCart(product['_id']),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}