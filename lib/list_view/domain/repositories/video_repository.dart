import 'package:dartz/dartz.dart';
import 'package:my_video_app/core/error/failures.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/domain/entities/videos_data_entity.dart';

abstract class VideoRepository {
  Future<Either<Failure, VideoEntity>> getVideo();

  Future<Either<Failure, VideosDataEntity>> getTrendingVideos();

  Future<Either<Failure, VideosDataEntity>> getFakeVideos();
}
