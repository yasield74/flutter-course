import 'package:cinemapedia_app/domain/entities/movie.dart';

abstract class MovieDataSource {
  Future<Movie> getNowPlaying({int page = 1});
}
