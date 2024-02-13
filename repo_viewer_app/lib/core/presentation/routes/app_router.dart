import 'package:auto_route/auto_route.dart';
import 'package:repo_viewer_app/auth/presentation/sign_in_page.dart';
import 'package:repo_viewer_app/splash/presentation/splash_page.dart';
import 'package:repo_viewer_app/starred_repos/presentation/starred_repos_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page, path: '/sign-in'),
        AutoRoute(page: StarredReposRoute.page, path: '/starred'),
      ];
}
