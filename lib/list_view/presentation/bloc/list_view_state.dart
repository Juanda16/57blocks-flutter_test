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

class Error extends ListViewState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
