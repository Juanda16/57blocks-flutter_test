import 'package:equatable/equatable.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';

class VideosDataEntity extends Equatable {
  final List<VideoEntity> videos;

  VideosDataEntity({required this.videos});

  @override
  // TODO: implement props
  List<Object?> get props => [videos];
}
