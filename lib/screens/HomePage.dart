import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/components/Layout.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      isHomePage: false,
      body: Column(
        children: [],
      ),
    );
  }

  // Widget _sliderComponent() {
  //   return CarouselSlider(
  //     items: items,
  //     options: CarouselOptions(
  //
  //     )
  //   );
  // }
}