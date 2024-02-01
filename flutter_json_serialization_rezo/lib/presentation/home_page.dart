import 'package:flutter/material.dart';
import 'package:flutter_json_serialization_rezo/data/settings.dart';
import 'package:flutter_json_serialization_rezo/data/user.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final Map<String, dynamic> settingsData = {
    "timestamp": "2021-10-21T22:47:52.262062",
    "user": {
      "email": "useremail@email.com",
      "number": 2132347765,
    },
    "is-premium": true,
    "theme-colors": [4282339765, 4278238420]
  };

  final settings = const Settings(
      user: User(email: 'some@email.com', phoneNumber: 554041),
      isPremium: false,
      themeColors: [Colors.cyan, Colors.indigo]);

  void convertToJson() {
    final json = settings.toJson();
    print('To Json: $json');
  }

  void convertFromJson() {
    final settings = Settings.fromJson(settingsData);
    print('From JSON: $settingsData');
  }

  void convertToDatabaseJson() {
    final json = settings.toDatabaseJson();
    print('To Database json $json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              onPressed: convertToJson,
              color: Colors.green[700],
              title: 'To JSON',
            ),
            const SizedBox(
              width: 10,
            ),
            CustomButton(
              onPressed: convertFromJson,
              color: Colors.blueGrey,
              title: 'From JSON',
            ),
            const SizedBox(
              width: 10,
            ),
            CustomButton(
              onPressed: convertToDatabaseJson,
              color: Colors.indigo,
              title: 'To Db JSON',
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color? color;
  final String title;
  final void Function() onPressed;
  const CustomButton({
    Key? key,
    required this.color,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(title),
    );
  }
}
