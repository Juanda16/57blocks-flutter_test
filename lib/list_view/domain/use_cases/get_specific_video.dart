import 'package:dartz/dartz.dart';
import 'package:my_video_app/core/error/failures.dart';
import 'package:my_video_app/core/usecases/usecase.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/domain/repositories/video_repository.dart';

class GetVideo extends UseCase<VideoEntity, NoParams> {
  final VideoRepository repository;

  GetVideo(this.repository);

  @override
  Future<Either<Failure, VideoEntity>> call(NoParams params) async {
    return await repository.getVideo();
  }
}
