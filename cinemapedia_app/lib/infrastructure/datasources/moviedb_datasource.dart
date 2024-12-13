import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/domain/datasource/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MovieDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Environment.movieDbKey, 'language': 'en-US'},
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final List<Movie> movies = [];

    return movies;
  }
}
