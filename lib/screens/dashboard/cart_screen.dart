import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "/CartScreen";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text("Cart Screen"),
    );
  }
}
