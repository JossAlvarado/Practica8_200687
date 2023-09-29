import 'package:flutter/material.dart';
import 'package:movieapp_200687/common/HttpHandler.dart';
import 'package:movieapp_200687/model/Media.dart';
import 'package:movieapp_200687/media_list.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media = movies; // Actualiza la lista de medios con las películas cargadas.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Image.network(_media[index].getPosterUrl()),
            ],
          );
        },
      ),
    );
  }
}
