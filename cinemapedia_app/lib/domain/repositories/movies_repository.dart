import 'package:cinemapedia_app/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<Movie> getNowPlaying({int page = 1});
}
