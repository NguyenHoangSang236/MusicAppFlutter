import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/bloc/songList/list_all_songs_bloc.dart';
import 'package:music_app/components/Layout.dart';

import '../entity/Song.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ListAllSongsBloc>(context).add(OnLoadAllSongsEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      isHomePage: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Your Songs',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            BlocBuilder<ListAllSongsBloc, ListAllSongsState>(
              builder: (context, listAllSongState) {
                List<Song>? songList = BlocProvider.of<ListAllSongsBloc>(context).songList;

                if(listAllSongState is ListAllSongsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                }

                if(listAllSongState is ListAllSongsLoadedState) {
                  songList = listAllSongState.songList;
                }

                return _songListComponent(songList ?? []);
              }
            )
          ],
        ),
      ),
    );
  }

  Widget _songComponent(Song song) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            height: 64,
            width: 64,
            margin: const EdgeInsets.only(right: 23),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: song.songImage == null
                ? const DecorationImage(image: AssetImage('assets/songImage.png'))
                : const DecorationImage(image: AssetImage('assets/avatar.png')),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                song.name,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                song.singer,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.white.withOpacity(0.5),
                  height: 1.5
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _songListComponent(List<Song> songList) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 15, 24, 24),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: songList.length,
            itemBuilder: (context, index) {
              return _songComponent(songList[index]);
            }
          )
        ],
      ),
    );
  }
}