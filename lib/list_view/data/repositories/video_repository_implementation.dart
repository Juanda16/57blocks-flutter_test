import 'package:dartz/dartz.dart';
import 'package:my_video_app/core/error/exceptions.dart';
import 'package:my_video_app/core/error/failures.dart';
import 'package:my_video_app/core/network/network_info.dart';
import 'package:my_video_app/list_view/data/data_sources/video_remote_data_source.dart';
import 'package:my_video_app/list_view/data/models/video_model.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/domain/entities/videos_data_entity.dart';
import 'package:my_video_app/list_view/domain/repositories/video_repository.dart';

typedef Future<VideosDataEntity> _ListOrVideo();

class VideoRepositoryImpl implements VideoRepository {
  final NetworkInfo networkInfo;
  final VideoRemoteDataSource remoteDataSource;

  VideoRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});
  @override
  Future<Either<Failure, VideosDataEntity>> getTrendingVideos() async {
    return await _getResult(() => remoteDataSource.getFakeVideos());
  }

  @override
  Future<Either<Failure, VideoEntity>> getVideo() {
    // TODO: implement getVideo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, VideosDataEntity>> getFakeVideos() async {
    return await _getResult(() => remoteDataSource.getFakeVideos());
  }

  Future<Either<Failure, VideosDataEntity>> _getResult(
    _ListOrVideo getList,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteList = await getList();
        VideoModel videoModel = VideoModel(videos: remoteList.videos);

        return Right(remoteList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
    // } else {
    //   try {
    //     final localNumber = await localDataSource.getLastNumber();
    //     return Right(localNumber);
    //   } on CacheException {
    //     return Left(CacheFailure());
    //   }
    // }
  }
}
