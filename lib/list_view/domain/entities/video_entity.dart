import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  //dynamic thumbnail;
  final String id, title, description, duration;
  bool like;
  final String thumbnailsUrl;

  VideoEntity(
      {required this.id,
      required this.title,
      this.description = '',
      this.duration = 'unknown ',
      this.like = false,
      this.thumbnailsUrl =
          "https://yachteskills.com/wp-content/themes/yacht/images/video-thumbnail-default.png"});

  changeLike() {
    this.like = !like;
  }

  @override
  List<Object?> get props => [id];
}
