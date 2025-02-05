import 'package:flutter/material.dart';
import 'package:tp2/ui/home.dart';
import 'package:tp2/ui/mytheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = MyTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TD2',
      theme: theme,
      home: Home(),
    );
  }
}