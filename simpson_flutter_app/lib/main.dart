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
  List<int> _listItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste Dinamik'),
      ),
      body: ListView.builder(
        itemCount: _listItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item ${_listItems[index]}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _listItems.add(_counter);
            _counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
