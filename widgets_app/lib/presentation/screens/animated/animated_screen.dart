import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  static const name = '/animated';

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 100;
    height = random.nextInt(300) + 100;
    borderRadius = random.nextInt(100).toDouble() + 20;
    color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
