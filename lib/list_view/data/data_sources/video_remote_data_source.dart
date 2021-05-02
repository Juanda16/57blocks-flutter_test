import 'package:my_video_app/list_view/data/models/video_model.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/domain/entities/videos_data_entity.dart';
//import 'package:youtube_api/youtube_api.dart';

abstract class VideoRemoteDataSource {
  Future<VideoModel> getTrendingVideos();
  Future<VideoModel> getSpecificVideo();
  Future<VideoModel> getFakeVideos();
}

class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  VideoRemoteDataSourceImpl();
  // static String key = 'YOUR_API_KEY';
  // YoutubeAPI ytApi = new YoutubeAPI(key);
  // List<YT_API> ytResult = [];

  // @override
  // Future<VideoModel> getSpecificVideo() async {
  //   final query = 'flutter';
  //   ytResult = await ytApi.search(query);
  // }
  //
  // @override
  // Future<VideoModel> getTrendingVideos() async {
  //   const regionCode = 'CO';
  //   ytResult = await ytApi.getTrends(regionCode: regionCode);
  // }

  @override
  Future<VideoModel> getFakeVideos() {
    List<VideoEntity> videos = [];
    videos.add(VideoEntity(
      id: '1',
      title: 'Mix - Melendi - Destino o casualidad',
      description: 'Medelendi - Sebastian Yatra',
      duration: '3:01',
      channelTitle: 'MyMusic',
      thumbnailsUrl: 'https://i.ytimg.com/vi/D9W4DLjmoOM/maxresdefault.jpg',
    ));
    videos.add(VideoEntity(
        id: '2',
        title: 'WEBINAR - Programmatic Trading in Java',
        description: 'For traders today, Python is the most',
        duration: '10:01',
        channelTitle: 'Java',
        thumbnailsUrl: 'http://i3.ytimg.com/vi/KEwdeCllNKI/hqdefault.jpg'));
    videos.add(VideoEntity(
        id: '3',
        title: 'LimitedBox (Flutter Widget)',
        description: 'LimitedBox (Flutter Widget)',
        channelTitle: 'Flutter',
        duration: '3:01',
        thumbnailsUrl: 'http://i3.ytimg.com/vi/uVki2CIzBTs/hqdefault.jpg'));
    videos.add(VideoEntity(
      id: '4',
      title: 'Mix - Melendi - Destino o casualidad',
      description: 'Medelendi - Sebastian Yatra',
      duration: '3:01',
      channelTitle: 'MyMusic',
      thumbnailsUrl: 'https://i.ytimg.com/vi/D9W4DLjmoOM/maxresdefault.jpg',
    ));
    videos.add(VideoEntity(
      id: '5',
      title: 'WEBINAR - Programmatic Trading in',
      description: 'For traders today, Python is the most',
      duration: '10:01',
      channelTitle: 'Java',
      thumbnailsUrl: 'http://i3.ytimg.com/vi/KEwdeCllNKI/hqdefault.jpg',
    ));
    videos.add(VideoEntity(
        id: '6',
        title: 'LimitedBox (Flutter Widget)',
        description: 'LimitedBox (Flutter Widget)',
        channelTitle: 'Flutter',
        duration: '3:01',
        thumbnailsUrl: 'http://i3.ytimg.com/vi/uVki2CIzBTs/hqdefault.jpg'));

    VideoModel? fakeVideos = VideoModel(videos: videos);
    return Future.value(fakeVideos);
  }

  @override
  Future<VideoModel> getSpecificVideo() {
    // TODO: implement getSpecificVideo
    throw UnimplementedError();
  }

  @override
  Future<VideoModel> getTrendingVideos() {
    // TODO: implement getTrendingVideos
    throw UnimplementedError();
  }
}

// = [
// VideoEntity(
// id: '1',
// title: 'first video',
// description: '',
// duration: '3:01',
// ),
// VideoEntity(
// id: '2',
// title: 'Second video',
// description: '',
// duration: '3:01',
// ),
// VideoEntity(
// id: '3',
// title: 'third video',
// description: '',
// duration: '3:01',
// ),
// VideoEntity(
// id: ' 4',
// title: 'fourth video',
// description: '',
// duration: '3:01',
// ),
// ];
