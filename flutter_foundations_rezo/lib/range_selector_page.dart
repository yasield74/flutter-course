import 'package:flutter/material.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key});

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: const Form(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              labelText: 'Minimum',
            ),
            SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormField(
              labelText: 'Maximum',
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
  });

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: true),
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelText),
    );
  }
}
