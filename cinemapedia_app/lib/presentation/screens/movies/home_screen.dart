import 'package:cinemapedia_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _HomeView(),
    bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final slideShowMovie = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final initialLoading = ref.watch(initialLoadingProvider);


    if(initialLoading) {
      return const  FullScreenLoader();
    }
    

    return Visibility(
      visible: !initialLoading,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppBar(),
            ),
      
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return   Column(
            children: [          
            MoviesSlideshow(movies: slideShowMovie),
            MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'Playing now',
            subTitle: 'Today',
            loadNextPage: () => ref.read( nowPlayingMoviesProvider.notifier).loadNextPage(),
            ),
             MovieHorizontalListView(
            movies: popularMovies,
            title: 'Popular Movies',
            subTitle: 'Today',
            loadNextPage: () => ref.read( nowPlayingMoviesProvider.notifier).loadNextPage(),
            ),
            SizedBox(height: 25,),
            MovieHorizontalListView(
              movies: topRatedMovies,
              title: 'Top Rated Movies',
              subTitle: 'Today',
              loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalListView(
              movies: upcomingMovies,
              title: 'Upcoming Movies',
              subTitle: 'Today',
              loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
            ),
          ],
        );
          }, childCount: 1)),
        ]
      ),
    );
  }
}
