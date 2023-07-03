import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        
          enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(color: Colors.white),
        // borderRadius: BorderRadius.circular(20),
      ),
      fillColor: Colors.grey[300],
      filled: true,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey)
      ),
    );
  }
}
