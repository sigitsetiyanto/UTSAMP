import 'package:flutter/material.dart';

class MyCircle extends StatelessWidget {
  const MyCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(
        'https://picsum.photos/200/300',
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
