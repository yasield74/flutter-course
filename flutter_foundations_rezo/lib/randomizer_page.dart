import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_foundations_rezo/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomizerPage extends ConsumerWidget {
  RandomizerPage({super.key});

  final randomGenerator = Random();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomizer = ref.watch(randomizerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Randomizer')),
      body: Center(
          child: Text(
        randomizer.generatedNumber?.toString() ?? 'Generate a number',
        style: const TextStyle(fontSize: 42),
      )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            ref.read(randomizerProvider).generateRandomNumber();
          },
          label: const Text('Generate')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
