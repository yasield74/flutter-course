import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  static const name = 'snackbar_screen';

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hello World'),
        action: SnackBarAction(label: 'Ok!', onPressed: () {}),
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar and Dialogs'),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => showCustomSnackBar(context),
            label: const Text('Show Snack Bar'),
            icon: const Icon(Icons.remove_red_eye_outlined)));
  }
}
