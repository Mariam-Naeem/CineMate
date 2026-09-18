import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinemate',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cinemate'),
        ),
        body: Center(
          child: Text('Welcome to Cinemate!'),
        ),
      ),
    );
  }
}