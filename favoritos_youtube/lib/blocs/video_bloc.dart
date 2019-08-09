import 'package:favoritos_youtube/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_youtube/models/video.dart';
import 'dart:async';

class VideoBloc implements BlocBase{

  Api api;

  List<Video> videos;

  final StreamController<List<Video>> _videosController = StreamController<List<Video>>();
  Stream get outVideos => _videosController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  VideoBloc(){
    api = Api();

    _searchController.stream.listen(_search);
  }

  void _search(String search) async{
    if(search != null){
      videos = await api.search(search);
    }else{
      videos -= await api.nextPage();
    }


    _videosController.sink.add(videos);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videosController.close();
    _searchController.close();
  }

}