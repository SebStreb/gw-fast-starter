import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GW fast starter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const tiles = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  Random random = Random();

  String randomize(int tile) {
    return "Tile $tile${random.nextBool() ? "A" : "B"}";
  }

  List<int> takeFour() {
    final copy = [...tiles]..shuffle(random);
    return copy.take(4).toList()..sort();
  }

  @override
  Widget build(BuildContext context) {
    final cards = takeFour();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("GW fast starter"),
        actions: [
          IconButton(
            onPressed: () => setState(() => random = Random()),
            icon: const Icon(Icons.change_circle),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    "Player tiles",
                  ),
                  const SizedBox(height: 16),
                  for (int tile in tiles)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        textAlign: TextAlign.center,
                        randomize(tile),
                      ),
                    )
                ],
              ),
              Column(
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    "Bonus cards",
                  ),
                  const SizedBox(height: 16),
                  Text("Card ${cards[0]}"),
                  const SizedBox(height: 8),
                  Text("Card ${cards[1]}"),
                  const SizedBox(height: 8),
                  Text("Card ${cards[2]}"),
                  const SizedBox(height: 8),
                  Text("Card ${cards[3]}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
