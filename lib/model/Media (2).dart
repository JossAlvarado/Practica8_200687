// Creado por: Uriel Maldonado Cortez
// Asignatura: Desarrollo Movil Integral
//Grado: 10   Grupo: "A"
// Docente: MTI. Marco Antonio Ramirez Hernandez
import 'dart:convert'; // Importa la biblioteca para codificar y decodificar JSON.
import 'package:movieapp_20091/common/Util.dart'; // Importa la clase Media desde un archivo llamado Media.dart.

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);

  factory Media(Map jsonMap) {
    try {
      return new Media.deserealize(jsonMap);
    } catch (ex) {
      throw ex;
    }
  }

  Media.deserealize(Map json)
      : id = json["id"].toInt(),
        voteAverage = json["vote_average"].toDouble(),
        title = json["title"],
        posterPath = json["poster_path"] ?? "",
        backdropPath = json["backdrop_path"] ?? "",
        overview = json["overview"],
        releaseDate = json["release_date"],
        genreIds = json["genre_ids"].toList();
}