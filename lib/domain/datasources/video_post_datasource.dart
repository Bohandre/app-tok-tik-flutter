import 'package:tok_tik_app/domain/entities/video_post.dart';

abstract class VideoPostDataSources {
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);

  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
