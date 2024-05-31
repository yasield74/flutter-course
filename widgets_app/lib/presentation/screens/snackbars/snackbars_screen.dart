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

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Are you sure ? '),
            content: const Text(
                'Reprehenderit do ipsum duis dolore. Pariatur tempor laboris pariatur irure irure. Dolore ea quis proident eu incididunt laboris nostrud esse id aliquip consequat mollit. Fugiat quis nisi exercitation pariatur consequat dolor id nulla incididunt. Lorem anim fugiat Lorem aute aute id. Consequat nulla tempor non mollit magna aliquip amet dolore irure est eiusmod ex magna quis. Eu excepteur id anim occaecat.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          );
        });
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
          icon: const Icon(Icons.remove_red_eye_outlined)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Sint officia culpa dolor velit. Velit nisi excepteur ad reprehenderit nisi incididunt proident non est reprehenderit id. Exercitation mollit sit Lorem consequat aute ut minim eiusmod. Quis aliqua in nostrud esse. Aliquip sunt nostrud ad laborum deserunt velit adipisicing consequat aliquip labore eiusmod ut ut. Minim ea anim deserunt proident.')
                  ]);
                },
                child: const Text('Licenses')),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                },
                child: const Text('Show Dialog'))
          ],
        ),
      ),
    );
  }
}
