import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/bloc/songList/list_all_songs_bloc.dart';
import 'package:music_app/screens/HomePage.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug
  );

  String? appCheckToken = await FirebaseAppCheck.instance.getToken(true);
  print('App Check token: $appCheckToken');

  // final emulatorHost = (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
  //     ? '171.245.250.94'
  //     : 'localhost';
  // await FirebaseStorage.instance.useStorageEmulator(emulatorHost, 9199);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ListAllSongsBloc>(
              create: (context) => ListAllSongsBloc()),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

