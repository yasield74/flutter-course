import 'package:flutter/material.dart';
import 'package:flutter_foundations_rezo/randomizer_page.dart';
import 'package:flutter_foundations_rezo/range_selected_form.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RangeSelectorPage extends HookWidget {
  RangeSelectorPage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        minValueSetter: (value) => min.value = value,
        maxValueSetter: (value) => max.value = value,
        formKey: formKey,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RandomizerPage(min: min.value, max: max.value);
            }));
          }
        },
      ),
    );
  }
}
