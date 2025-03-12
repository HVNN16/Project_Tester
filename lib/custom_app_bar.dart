import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int cartItemCount;
  final void Function(BuildContext) onCartPressed;
  final Map<String, dynamic>? user;
  final VoidCallback onLogout;

  const CustomAppBar({
    required this.title,
    this.cartItemCount = 0,
    required this.onCartPressed,
    this.user,
    required this.onLogout,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        if (user != null)
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Text(user!['name'], style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: onLogout,
                ),
              ],
            ),
          ),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => onCartPressed(context),
            ),
            if (cartItemCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    cartItemCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}