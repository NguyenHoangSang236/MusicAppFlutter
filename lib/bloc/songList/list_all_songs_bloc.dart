import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'list_all_songs_event.dart';
part 'list_all_songs_state.dart';

class ListAllSongsBloc extends Bloc<ListAllSongsEvent, ListAllSongsState> {
  ListAllSongsBloc() : super(ListAllSongsInitial()) {
    on<OnLoadAllSongsEvent>((event, emit) async {
      final Reference storageRef = FirebaseStorage.instance.ref().child('');
      final ListResult listResult = await storageRef.listAll();
      for (Reference elem in listResult.prefixes) {
        print('');
      }
      for (var item in listResult.items) {
        // The items under storageRef.
      }

    });
  }
}
