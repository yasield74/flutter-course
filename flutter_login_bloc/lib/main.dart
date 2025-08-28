import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_login_bloc/theme/dark_mode.dart';
import 'package:flutter_login_bloc/theme/light_mode.dart';
import 'package:flutter_login_bloc/firebase_options.dart';

void main() async  { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginPage(), 
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}