import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_youtube/blocs/video_bloc.dart';
import 'package:favoritos_youtube/delegates/data_seach.dart';
import 'package:favoritos_youtube/widget/video_tile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<VideoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset('src/youtube-logo.png'),
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text('0', style: TextStyle(color: Colors.white, fontSize: 16.0),),
          ),
          IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () async {
                String result = await showSearch(context: context, delegate: DataSearch());
                if(result != null) bloc.inSearch.add(result);
              })
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: bloc.outVideos,
          builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemBuilder: (context, index){
                  //if(index < snapshot.data.lenght) {
                    return VideoTile(snapshot.data[index]);
                  //}else{
                   // return
                  //},
                },
              itemCount: snapshot.data.lenght + 1,
            );
          }else{
            return Container();
          }
          }
      ),
    );
  }
}
