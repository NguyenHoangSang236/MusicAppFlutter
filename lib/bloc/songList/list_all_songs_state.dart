part of 'list_all_songs_bloc.dart';

abstract class ListAllSongsState extends Equatable {
  const ListAllSongsState();
}

class ListAllSongsInitial extends ListAllSongsState {
  @override
  List<Object> get props => [];
}

class ListAllSongsLoadingState extends ListAllSongsState {
  @override
  List<Object> get props => [];
}

class ListAllSongsLoadedState extends ListAllSongsState {
  final List<Reference>? refList;

  const ListAllSongsLoadedState(this.refList);

  @override
  List<Object?> get props => [refList];
}

