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

