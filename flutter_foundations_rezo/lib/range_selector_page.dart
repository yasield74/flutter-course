import 'package:flutter/material.dart';
import 'package:flutter_foundations_rezo/randomizer_page.dart';
import 'package:flutter_foundations_rezo/range_selected_form.dart';

class RangeSelectorPage extends StatelessWidget {
  RangeSelectorPage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RandomizerPage();
            }));
          }
        },
      ),
    );
  }
}
