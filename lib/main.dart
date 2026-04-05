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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E0E3),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              color: const Color.fromARGB(255, 101, 207, 243),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back, color: Colors.black),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "5th April, 2026",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 60,
                    color: const Color.fromARGB(255, 153, 49, 49),
                    child: const Center(child: Text("22CSE007")),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 60,
                    color: const Color.fromARGB(255, 240, 109, 53),
                    child: const Center(child: Text("AB+")),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 60,
                    color: const Color.fromARGB(255, 48, 149, 231),
                    child: const Center(child: Text("Dhaka")),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Center(
                child: Container(
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 184, 123, 32),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "110-007-22",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 142, 150, 162),
        shape: const CircleBorder(),
        child: const Text("Mahruf"),
      ),
    );
  }
}