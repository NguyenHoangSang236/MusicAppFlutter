part of 'list_all_songs_bloc.dart';

abstract class ListAllSongsEvent extends Equatable {
  const ListAllSongsEvent();
}

class OnLoadAllSongsEvent extends ListAllSongsEvent {
  @override
  List<Object?> get props => [];
}