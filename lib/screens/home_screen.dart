import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Property Search')),
      body: Center(
        child: Text('Search for properties here!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add property upload logic
        },
        child: Icon(Icons.search),
      ),
    );
  }
}
