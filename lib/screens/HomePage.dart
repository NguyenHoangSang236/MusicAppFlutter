import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/bloc/songList/list_all_songs_bloc.dart';
import 'package:music_app/components/Layout.dart';


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
      body: Column(
        children: [],
      ),
    );
  }

  List<Widget> _sliderList(List<Reference> list) {
    return [];
  }

  Widget _sliderComponent(List<Reference> list) {
    return CarouselSlider(
      items: _sliderList(list),
      options: CarouselOptions(

      )
    );
  }
}