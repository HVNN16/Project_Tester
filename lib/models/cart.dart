class CartItem {
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final String image;
  final double total;

  CartItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.total,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      image: json['image'] as String,
      total: (json['total'] as num).toDouble(),
    );
  }
}

class Cart {
  final List<CartItem> items;
  final double subtotal;

  Cart({required this.items, required this.subtotal});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      subtotal: double.parse(json['subtotal'].toString()),
    );
  }
}