part of 'list_view_bloc.dart';

abstract class ListViewState extends Equatable {
  const ListViewState();
  @override
  List<Object> get props => [];
}

class Empty extends ListViewState {}

class Loading extends ListViewState {}

class Loaded extends ListViewState {
  final VideosDataEntity listView;

  Loaded({required this.listView});

  @override
  List<Object> get props => [listView];
}

class Playing extends ListViewState {
  final bool isPlaying;

  Playing(this.isPlaying);

  @override
  List<Object> get props => [isPlaying];
}

class Error extends ListViewState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
