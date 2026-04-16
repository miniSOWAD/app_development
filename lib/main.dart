import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecondaryNumbersScreen(),
    );
  }
}

class SecondaryNumbersScreen extends StatefulWidget {
  const SecondaryNumbersScreen({super.key});

  @override
  State<SecondaryNumbersScreen> createState() =>
      _SecondaryNumbersScreenState();
}

class _SecondaryNumbersScreenState extends State<SecondaryNumbersScreen> {
  List<Map<String, String>> numbers = [
    {"num": "+1 (555) 987-6543", "sub": "Home • Added 2mo ago"},
    {"num": "+44 20 7123 4567", "sub": "Work • Unverified"},
  ];

  void deleteItem(int index) {
    setState(() {
      numbers.removeAt(index);
    });
  }

  void editItem(int index) {
    TextEditingController numController =
        TextEditingController(text: numbers[index]["num"]);
    TextEditingController subController =
        TextEditingController(text: numbers[index]["sub"]);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Edit"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: numController),
              TextField(controller: subController),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  numbers[index]["num"] = numController.text;
                  numbers[index]["sub"] = subController.text;
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            )
          ],
        );
      },
    );
  }

  Widget buildCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2A2A),
        borderRadius: BorderRadius.circular(25),

        // Glow effect like your image
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.25),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          // Circle phone icon
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.08),
            ),
            child: const Icon(Icons.phone, color: Colors.white70),
          ),

          const SizedBox(width: 16),

          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  numbers[index]["num"]!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  numbers[index]["sub"]!,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // Edit
          GestureDetector(
            onTap: () => editItem(index),
            child: const Icon(Icons.edit, color: Colors.white70),
          ),

          const SizedBox(width: 16),

          // Delete
          GestureDetector(
            onTap: () => deleteItem(index),
            child: const Icon(Icons.delete, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1A1A),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              "Secondary Numbers",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Column(
              children: List.generate(numbers.length, (index) {
                return buildCard(index);
              }),
            ),
          ],
        ),
      ),
    );
  }
}