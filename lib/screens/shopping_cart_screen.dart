import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});
  @override
  State<StatefulWidget> createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Shopping Cart"),
    );
  }
}
