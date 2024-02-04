import 'package:flutter/material.dart';
import 'package:flutter_foundations_rezo/random_change_notifier.dart';
import 'package:flutter_foundations_rezo/range_selector_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const AppWidget());
}

final randomizerProvider =
    ChangeNotifierProvider((ref) => RandomizerChangeNotifier());

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Randomizer',
        home: RangeSelectorPage(),
      ),
    );
  }
}
