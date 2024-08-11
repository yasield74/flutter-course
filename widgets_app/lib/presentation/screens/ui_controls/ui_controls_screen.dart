import 'package:flutter/material.dart';

class UIControlScreen extends StatelessWidget {
  const UIControlScreen({super.key});

  static const name = '/ui-controls';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UI Controls'),
        ),
        body: const _UIControlsView());
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView({
    super.key,
  });

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, boat, airplane }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Enable developer mode'),
            value: isDeveloper,
            onChanged: (value) {
              setState(() {
                isDeveloper = !isDeveloper;
              });
            }),
        ExpansionTile(
          title: const Text("Transportation vehicle"),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                title: const Text('Car'),
                subtitle: const Text('Select car as transportation'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.car;
                    })),
            RadioListTile(
                title: const Text('Boat'),
                subtitle: const Text('Select boat as transportation'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.boat;
                    })),
            RadioListTile(
                title: const Text('Airplane'),
                subtitle: const Text('Select airplane as transportation'),
                value: Transportation.airplane,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.airplane;
                    }))
          ],
        ),
        CheckboxListTile(
          title: const Text('Do you want Breakfast?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Do you want Lunch?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Do you want Dinner?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        )
      ],
    );
  }
}
