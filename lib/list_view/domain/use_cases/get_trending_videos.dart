import 'package:dartz/dartz.dart';
import 'package:my_video_app/core/error/failures.dart';
import 'package:my_video_app/core/usecases/usecase.dart';
import 'package:my_video_app/list_view/domain/entities/videos_data_entity.dart';
import 'package:my_video_app/list_view/domain/repositories/video_repository.dart';

class GetTrendingVideos extends UseCase<VideosDataEntity, NoParams> {
  final VideoRepository repository;
  GetTrendingVideos(this.repository);

  @override
  Future<Either<Failure, VideosDataEntity>> call(NoParams params) {
    return repository.getTrendingVideos();
  }
}
