// main.dart
import 'package:flutter/material.dart';
import 'package:toko/screens/home.dart';

void main() {
  runApp(const Toku());
}

class Toku extends StatelessWidget {
  const Toku({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Use const for the HomePage instance
    );
  }
}
