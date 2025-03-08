// product.dart
class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final double? originalPrice;
  final String image;
  final bool sale;
  final bool newArrival;
  final bool bestSeller;
  final String description;
  final String content;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.originalPrice,
    required this.image,
    required this.sale,
    required this.newArrival,
    required this.bestSeller,
    required this.description,
    required this.content,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: json['originalPrice'] != null 
          ? (json['originalPrice'] as num).toDouble() 
          : null,
      image: json['image'] as String,
      sale: json['sale'] as bool,
      newArrival: json['newArrival'] as bool,
      bestSeller: json['bestSeller'] as bool,
      description: json['description'] as String,
      content: json['content'] as String,
    );
  }
}