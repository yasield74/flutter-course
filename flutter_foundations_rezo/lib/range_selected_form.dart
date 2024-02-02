import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm(
      {Key? key,
      required this.formKey,
      required this.minValueSetter,
      required this.maxValueSetter})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                intValueSetter: minValueSetter,
                labelText: 'Minimum',
              ),
              const SizedBox(
                height: 12,
              ),
              RangeSelectorTextFormField(
                labelText: 'Maximum',
                intValueSetter: maxValueSetter,
              ),
            ],
          ),
        ));
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    super.key,
    required this.labelText,
    required this.intValueSetter,
  });

  final String labelText;
  final IntValueSetter intValueSetter;

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
