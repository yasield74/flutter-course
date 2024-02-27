import 'package:flutter_tiktok_app_1/domain/data_sources/video_post_datasource.dart';
import 'package:flutter_tiktok_app_1/domain/entities/video_post.dart';
import 'package:flutter_tiktok_app_1/infrastructure/models/local_video_model.dart';
import 'package:flutter_tiktok_app_1/shared/data/local_video_posts.dart';

class LocalVideoDataSource implements VideoPostDataSource {
  @override
  Future<List<VideoPost>> getFavotireVideosByUser(String userID) {
    // TODO: implement getFavotireVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
    return newVideos;
  }
}
