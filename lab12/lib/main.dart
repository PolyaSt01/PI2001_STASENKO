import 'package:flutter/material.dart';
import 'classes/mainMachine.dart';
import 'resources.dart';
import 'classes/enum.dart';
import 'coffee.dart';
import 'classes/res.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Machine? machine;
  Resources resources = Resources(0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Coffee Machine'),
          backgroundColor: Colors.brown,
          bottom: const TabBar(
            tabs: [
              Icon(Icons.coffee_maker),
              Icon(Icons.add_shopping_cart),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            coffeeScreen(resources: resources),
            resourceScreen(resources: resources),
          ],
        ),
      ),
    );
  }
}