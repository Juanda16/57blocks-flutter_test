import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:my_video_app/list_view/data/data_sources/video_remote_data_source.dart';
import 'package:my_video_app/list_view/data/repositories/video_repository_implementation.dart';
import 'package:my_video_app/list_view/domain/repositories/video_repository.dart';
import 'package:my_video_app/list_view/presentation/bloc/list_view_bloc.dart';

import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';
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
      //localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<VideoRemoteDataSource>(
    () => VideoRemoteDataSourceImpl(),
  );

  // sl.registerLazySingleton<CounterNumberLocalDataSource>(
  //   () => CounterNumberLocalDataSourceImpl(sharedPreferences: sl()),
  // );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //! External
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  //sl.registerLazySingleton(() => DataConnectionChecker());
  // final initialValue = json.encode({"random": 0});
  // sharedPreferences.setString('CACHED_NUMBER', initialValue);
}
