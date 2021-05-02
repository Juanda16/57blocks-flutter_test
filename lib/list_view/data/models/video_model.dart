import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/domain/entities/videos_data_entity.dart';
//import 'package:youtube_api/yt_video.dart';

class VideoModel extends VideosDataEntity {
  VideoModel({required List<VideoEntity> videos}) : super(videos: videos);
}
