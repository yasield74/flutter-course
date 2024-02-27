import 'package:flutter_tiktok_app_1/domain/data_sources/video_post_datasource.dart';
import 'package:flutter_tiktok_app_1/domain/entities/video_post.dart';
import 'package:flutter_tiktok_app_1/domain/repository/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDataSource videoPostDataSource;

  VideoPostsRepositoryImpl({required this.videoPostDataSource});

  @override
  Future<List<VideoPost>> getFavotireVideosByUser(String userID) {
    // TODO: implement getFavotireVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDataSource.getTrendingVideosByPage(page);
  }
}
