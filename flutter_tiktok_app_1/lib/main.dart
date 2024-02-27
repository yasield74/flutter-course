import 'package:flutter/material.dart';
import 'package:flutter_tiktok_app_1/config/theme/app_themne.dart';
import 'package:flutter_tiktok_app_1/infrastructure/data_sources/local_video_datasource_impl.dart';
import 'package:flutter_tiktok_app_1/infrastructure/repositories/video_post_repository.dart';
import 'package:flutter_tiktok_app_1/presentation/providers/discover_provider.dart';
import 'package:flutter_tiktok_app_1/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videoPostDataSource: LocalVideoDataSource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) =>
              DiscoverProvider(videosRepository: videoPostRepository)
                ..loadNextPage(),
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
