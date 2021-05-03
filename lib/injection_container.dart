import 'package:get_it/get_it.dart';
import 'package:my_video_app/list_view/data/data_sources/video_remote_data_source.dart';
import 'package:my_video_app/list_view/data/repositories/video_repository_implementation.dart';
import 'package:my_video_app/list_view/domain/repositories/video_repository.dart';
import 'package:my_video_app/list_view/presentation/bloc/list_view_bloc.dart';

import 'core/network/network_info.dart';
import 'list_view/domain/use_cases/get_trending_videos.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => ListViewBloc(
        getTrendingVideos: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetTrendingVideos(sl()));

  // Repository
  sl.registerLazySingleton<VideoRepository>(
    () => VideoRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<VideoRemoteDataSource>(
    () => VideoRemoteDataSourceImpl(),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //! External
}
