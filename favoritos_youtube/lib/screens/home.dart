import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_youtube/blocs/favorite_bloc.dart';
import 'package:favoritos_youtube/blocs/video_bloc.dart';
import 'package:favoritos_youtube/delegates/data_seach.dart';
import 'package:favoritos_youtube/models/video.dart';
import 'package:favoritos_youtube/screens/favorites.dart';
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
            child: StreamBuilder<Map<String, Video>>(
              stream: BlocProvider.of<FavoriteBloc>(context).outFav,
                builder: (context, snapshot){
                  if(snapshot.hasData) return Text('${snapshot.data.length}');
                  else return Container();
                }
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> Favorites())
                );
              }),
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
          initialData: [],
          builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemBuilder: (context, index){
                  if(index < snapshot.data.length) {
                    return VideoTile(snapshot.data[index]);
                  }else if(index > 1){
                    bloc.inSearch.add(null);
                    return Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),),
                    );
                  }else{
                    return Container();
                  }
                },
              itemCount: snapshot.data.length + 1,
            );
          }else{
            return Container();
          }
          }
      ),
    );
  }
}
