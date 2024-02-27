import 'package:flutter_tiktok_app_1/domain/entities/video_post.dart';

abstract class VideoPostRepository {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);

  Future<List<VideoPost>> getFavotireVideosByUser(String userID);
}
