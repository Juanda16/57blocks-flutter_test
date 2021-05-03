part of 'list_view_bloc.dart';

abstract class ListViewEvent extends Equatable {
  const ListViewEvent();
  @override
  List<Object?> get props => [];
}

class GetTrendingVideosEvent extends ListViewEvent {
  GetTrendingVideosEvent();
}

class PlayingVideoEvent extends ListViewEvent {
  PlayingVideoEvent();
}
