// screens/home.dart
import 'package:flutter/material.dart';
import 'package:toko/screens/colors.dart';
import 'package:toko/screens/family_page.dart';
import 'package:toko/screens/numbers_page.dart';
import 'package:toko/screens/phrases.dart';
// Import your Phrases screen

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 218, 218),
      appBar: AppBar(
        title: const Text(
          'Toku',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 131, 69, 69),
      ),
      body: ListView(
        children: [
          Category(
            color: const Color.fromARGB(255, 223, 102, 33),
            text: 'Numbers',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Numbers()),
              );
            },
          ),
          Category(
            text: 'Family Members',
            color: const Color.fromARGB(255, 31, 172, 18),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FamilyMembers()),
              );
            },
          ),
          Category(
            text: 'Colors',
            color: const Color.fromARGB(255, 138, 9, 131),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ColorsPage()),
              );
            },
          ),
          Category(
            text: 'Phrases',
            color: const Color.fromARGB(255, 27, 101, 170),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PhrasesPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        color: color,
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
