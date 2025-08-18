import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/domain/datasource/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Environment.movieDbKey, 'language': 'en-US'},
    ),
  );

  List<Movie> _jsonToMovies (Map<String, dynamic> json) {      
    final moviesDBResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies =
        moviesDBResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster')
            .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
            .toList();
    return movies;

  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
     final response = await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
   final response = await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcomingMovies({int page = 1}) async {
  final response = await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }
}
