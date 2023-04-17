import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'list_all_songs_event.dart';
part 'list_all_songs_state.dart';

class ListAllSongsBloc extends Bloc<ListAllSongsEvent, ListAllSongsState> {
  ListAllSongsBloc() : super(ListAllSongsInitial()) {
    on<OnLoadAllSongsEvent>((event, emit) async {
      try {
        final userCredential = await FirebaseAuth.instance.signInAnonymously();

        User? user = userCredential.user;

        final Reference storageRef = FirebaseStorage.instance.ref();

        final ListResult listResult = await storageRef.list();

        print(listResult.items);
      } on FirebaseAuthException catch (e) {
        e.stackTrace;
      }

    });
  }
}
