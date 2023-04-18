import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:music_app/entity/Song.dart';

import '../../entity/Song.dart';

part 'list_all_songs_event.dart';
part 'list_all_songs_state.dart';

class ListAllSongsBloc extends Bloc<ListAllSongsEvent, ListAllSongsState> {
  List<Song>? songList;

  ListAllSongsBloc() : super(ListAllSongsInitial()) {
    on<OnLoadAllSongsEvent>((event, emit) async {
      emit(ListAllSongsLoadingState());
      try {
        List<Song> list = [];
        final userCredential = await FirebaseAuth.instance.signInAnonymously();

        User? user = userCredential.user;

        final Reference storageRef = FirebaseStorage.instance.ref();
        final ListResult listResult = await storageRef.list();

        for(Reference ref in listResult.items) {
          list.add(getSongFromReference(ref));
        }

        songList = list;

        emit(ListAllSongsLoadedState(list));
      } on FirebaseAuthException catch (e) {
        e.stackTrace;
      }
    });
  }

  Song getSongFromReference(Reference ref) {
    String refName = ref.fullPath.substring(0, ref.fullPath.length - 4);
    String songName = refName.substring(0, refName.indexOf('_')).replaceAll('-', ' ');
    String singerName = refName.substring(refName.indexOf('_') + 1).replaceAll('-', ' ');

    return Song(songName, singerName);
  }
}
