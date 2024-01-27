import 'package:flutter/material.dart';
import 'package:flutter_tiktok_app_1/config/theme/app_themne.dart';
import 'package:flutter_tiktok_app_1/presentation/providers/discover_provider.dart';
import 'package:flutter_tiktok_app_1/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => DiscoverProvider()..loadNextPage(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
