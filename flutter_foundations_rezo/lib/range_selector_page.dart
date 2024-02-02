import 'package:flutter/material.dart';
import 'package:flutter_foundations_rezo/randomizer_page.dart';
import 'package:flutter_foundations_rezo/range_selected_form.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key});

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  int _min = 0;
  int _max = 0;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        minValueSetter: (value) => _min = value,
        maxValueSetter: (value) => _max = value,
        formKey: formKey,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RandomizerPage(min: _min, max: _max);
            }));
          }
        },
      ),
    );
  }
}
