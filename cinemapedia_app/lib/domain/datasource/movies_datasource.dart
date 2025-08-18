import 'package:cinemapedia_app/domain/entities/movie.dart';

abstract class MoviesDataSource {
    Future<List<Movie>> getNowPlaying({int page = 1});

    Future<List<Movie>> getPopularMovies({int page = 1});

    Future<List<Movie>> getTopRatedMovies({int page = 1});

    Future<List<Movie>> getUpcomingMovies({int page = 1});
}
