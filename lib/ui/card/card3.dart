import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: const Center(
        child: Text('Ecran 3', textDirection: TextDirection.ltr),
      ),
    );
  }
}