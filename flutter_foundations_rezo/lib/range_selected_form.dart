import 'package:flutter/material.dart';
import 'package:flutter_foundations_rezo/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends ConsumerWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                intValueSetter: (value) =>
                    ref.read(randomizerProvider.notifier).setMin(value),
                labelText: 'Minimum',
              ),
              const SizedBox(
                height: 12,
              ),
              RangeSelectorTextFormField(
                labelText: 'Maximum',
                intValueSetter: (value) =>
                    ref.read(randomizerProvider.notifier).setMax(value),
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
