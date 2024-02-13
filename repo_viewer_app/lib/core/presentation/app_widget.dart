import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer_app/auth/shared/providers.dart';
import 'routes/app_router.dart';

final initializationProvider = FutureProvider((ref) async {
  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkAndUpdateAuthStatus();
  return unit;
});

class AppWidget extends ConsumerWidget {
  AppWidget({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authNotifierProvider, (previous, state) {});
    ref.watch(initializationProvider);
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Repo Viewer',
    );
  }
}


//TODO: Min 7:52 