import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<int> items = [];

  Color getColor(int value) {
    return value.isEven ? Color.fromARGB(255, 255, 142, 44) : Color.fromARGB(255, 9, 110, 51);
  }

  bool isPrime(int n) {
    if (n <= 1) return false;
    if (n <= 3) return true;

    if (n % 2 == 0 || n % 3 == 0) return false;

    int i = 5;
    while (i * i <= n) {
      if (n % i == 0 || n % (i + 2) == 0) return false;
      i += 6;
    }

    return true;
  }

  String getType(int value) {
    if (isPrime(value)) return 'nombre premier';
    return value.isEven ? 'pair' : 'impair';
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      items.add(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_counter ${getType(_counter)}'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          int value = items[index];
          return ListTile(
            tileColor: getColor(value),
            title: Text(
              '$value',
              style: const TextStyle(color: Colors.white),
            ),
            leading: isPrime(value)
                ? Image.asset('asserts/images/ananas.png')
                : value.isEven
                    ? Image.asset('asserts/images/poire.png')
                    : Image.asset('asserts/images/pomme.png'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: _counter == 0 ? Color.fromARGB(255, 100, 13, 126) : null,
        child: const Icon(Icons.add),
      ),
    );
  }
}
