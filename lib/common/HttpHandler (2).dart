// Creado por: Uriel Maldonado Cortez
// Asignatura: Desarrollo Movil Integral
//Grado: 10   Grupo: "A"
// Docente: MTI. Marco Antonio Ramirez Hernandez
import 'dart:async'; // Importa la biblioteca para manejar operaciones asíncronas.
import 'dart:convert'; // Importa la biblioteca para codificar y decodificar JSON.
import 'package:http/http.dart'
    as http; // Importa la biblioteca para realizar solicitudes HTTP.
import 'package:movieapp_20091/common/Constants.dart'; // Importa un archivo Constants.dart.
import 'package:movieapp_20091/model/Media.dart'; // Importa la definición de la clase Media.

class HttpHandler {
  final String _baseUrl = "api.themoviedb.org"; // Define la URL base de la API.
  final String _lenguaje =
      "es-MX"; // Define el lenguaje deseado para las respuestas.

  // Define una función asincrónica para obtener datos JSON desde una URI.
  Future<dynamic> getJson(Uri uri) async {
    http.Response response =
        await http.get(uri); // Realiza una solicitud GET HTTP.
    return json
        .decode(response.body); // Decodifica la respuesta JSON.
  }

  // Define una función para recuperar una lista de películas.
  Future<List<Media>> fetchMovies() {
    var uri = new Uri.https(
        _baseUrl,
        "3/movie/popular", // Crea una URI para obtener películas populares.
        {
          'api_key': API_KEY,
          'page': "1",
          'languaje': _lenguaje
        }); // Parámetros de la solicitud.
    // Llama a la función getJson para obtener datos y mapearlos en objetos de tipo Media.
    return getJson(uri).then(((data) =>
        data['results'].map<Media>((item) => new Media(item)).toList()));
  }
}
