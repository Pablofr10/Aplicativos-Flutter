import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_youtube/api.dart';
import 'package:favoritos_youtube/screens/home.dart';
import 'package:flutter/material.dart';

import 'blocs/video_bloc.dart';

void main() {

  Api api = Api();
  api.search("Fresno");

  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideoBloc(),
      child: MaterialApp(
        title: "Flutter App",
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
