import 'package:flutter/material.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key});

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              intValueSetter: (value) {
                _min = value;
              },
              labelText: 'Minimum',
            ),
            const SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormField(
              labelText: 'Maximum',
              intValueSetter: (value) {
                _max = value;
              },
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          //TODO: Validate the form.
          //TODO: Navigate to the generator page.
        },
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    super.key,
    required this.labelText,
    required this.intValueSetter,
  });

  final String labelText;
  final void Function(int value) intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: true),
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelText),
      onSaved: (newValue) {
        intValueSetter(int.parse(newValue ?? ''));
      },
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be a number';
        } else {
          return null;
        }
      },
    );
  }
}
