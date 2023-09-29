// Creado por: Uriel Maldonado Cortez
// Asignatura: Desarrollo Movil Integral
//Grado: 10   Grupo: "A"
// Docente: MTI. Marco Antonio Ramirez Hernandez
import 'package:flutter/material.dart'; // Importa la biblioteca Flutter para construir interfaces de usuario.
import 'package:movieapp_20091/common/HttpHandler.dart'; // Importa la clase HttpHandler desde un archivo llamado HttpHandler.dart.
import 'package:movieapp_20091/model/Media.dart'; // Importa la clase Media desde un archivo llamado Media.dart.

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() =>
      new _MediaListState(); // Define una clase que extiende StatefulWidget y proporciona un método para crear su estado interno.
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
      _media.addAll(movies);
    });
  }

  // Define una clase que extiende State y representa el estado interno de MediaList.
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              new Image.network(_media[index].getPosterUrl())
            ],
          );
        },
      ),
    );
  }
}
