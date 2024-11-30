import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});
  static const String name = '/buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screem'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {context.pop()},
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => {}, child: const Text('Elevated')),
              const ElevatedButton(
                  onPressed: null, child: Text('Elevated Disabled')),
              ElevatedButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.access_alarm_rounded),
                label: const Text('Elevated Icon'),
              ),
              FilledButton(onPressed: () => {}, child: const Text('Filled')),
              FilledButton.icon(
                  onPressed: () => {},
                  icon: const Icon(Icons.ac_unit),
                  label: const Text('Filled')),
              OutlinedButton(
                onPressed: () => {},
                child: const Text('Outlined'),
              ),
              OutlinedButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.calendar_month_rounded),
                label: const Text('Outlined'),
              ),
              TextButton(onPressed: () => {}, child: const Text('Text button')),
              TextButton.icon(
                onPressed: () => {},
                label: const Text('Text icon'),
                icon: const Icon(Icons.access_alarm_sharp),
              ),
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.app_registration_rounded),
              ),
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.app_registration_rounded),
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(colors.primary))),
              const CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () => {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Custom Button',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
