import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _buildUserList(),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Container(
          child: Text("Favorite Screen"),
        ),
      ),
    );
  }
}