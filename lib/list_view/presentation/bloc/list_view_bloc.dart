import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_video_app/core/error/failures.dart';
import 'package:my_video_app/core/usecases/usecase.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/domain/entities/videos_data_entity.dart';
import 'package:my_video_app/list_view/domain/use_cases/get_specific_video.dart';
import 'package:my_video_app/list_view/domain/use_cases/get_trending_videos.dart';

part 'list_view_event.dart';
part 'list_view_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a integer or zero.';

class ListViewBloc extends Bloc<ListViewEvent, ListViewState> {
  final GetTrendingVideos getTrendingVideos;

  //final GetVideo getVideo;
  //final LikeVIdeo likeVideo;

  ListViewBloc({required this.getTrendingVideos}) : super(Empty());

  @override
  Stream<ListViewState> mapEventToState(
    ListViewEvent event,
  ) async* {
    if (event is PlayingVideoEvent) {
      yield Playing(true);
    }
    if (event is GetTrendingVideosEvent) {
      yield Loading();
      final failureOrList = await getTrendingVideos(NoParams());
      print('getting data');
      yield* _eitherLoadedOrErrorState(failureOrList);
    }
  }

  Stream<ListViewState> _eitherLoadedOrErrorState(
    Either<Failure, VideosDataEntity> failureOrList,
  ) async* {
    yield failureOrList.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)), (list) {
      return Loaded(listView: list);
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
