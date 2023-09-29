import 'package:movieapp_200687/common/Util.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate; // Corregido el nombre de la variable releaseDate
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);

  // Constructor de fábrica para crear una instancia de Media desde un mapa JSON.
  factory Media(Map<String, dynamic> jsonMap) {
    try {
      return Media.deserialize(jsonMap);
    } catch (ex) {
      throw ex;
    }
  }

  // Constructor que toma un mapa JSON y asigna sus valores a las propiedades de Media.
  Media.deserialize(Map<String, dynamic> json)
      : id = json["id"],
        voteAverage = json["vote_average"].toDouble(), // Corregido el nombre de la clave
        title = json["title"],
        posterPath = json["poster_path"] ?? "",
        backdropPath = json["backdrop_path"] ?? "",
        overview = json["overview"],
        releaseDate = json["release_date"], // Corregido el nombre de la clave
        genreIds = json["genre_ids"].toList(); // Corregido el nombre de la clave
}
