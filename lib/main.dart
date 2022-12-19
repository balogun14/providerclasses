// ignore_for_file: prefer_const_constructors, must_be_immutable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerclasses/providers/counter_provider.dart';
import 'package:providerclasses/screens/screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => Counter(),
      )
    ],
    child: ScreenPage(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<Favorites>(context).color,
        title: Text(
          'My favorite food is ${Provider.of<Favorites>(context).fruit}',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            FoodButton(
              fruit: 'Apples',
              color: Colors.green,
            ),
            FoodButton(
              fruit: 'Oranges',
              color: Colors.orange,
            ),
            FoodButton(
              fruit: 'Mango',
              color: Colors.amberAccent,
            ),
            FoodButton(fruit: 'Banana', color: Colors.yellowAccent)
          ],
        ),
      ),
    );
  }
}

class FoodButton extends StatelessWidget {
  String fruit;
  Color color;
  FoodButton({super.key, required this.fruit, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // ignore: prefer_const_constructors
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      onPressed: () {
        Provider.of<Favorites>(context, listen: false)
            .changeFruit(fruit, color);
      },
      child: Text(
        fruit,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

class Favorites extends ChangeNotifier {
  String fruit = 'unknown';
  Color? color = Colors.red;

  void changeFruit(String newFruit, Color newColor) {
    fruit = newFruit;
    color = newColor;
    notifyListeners();
  }
}
