import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _buildUserList(),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Container(
          child: Text("Cart Screen"),
        ),
      ),
    );
  }
}