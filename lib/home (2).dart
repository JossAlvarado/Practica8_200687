// Creado por: Uriel Maldonado Cortez
// Asignatura: Desarrollo Movil Integral
//Grado: 10   Grupo: "A"
// Docente: MTI. Marco Antonio Ramirez Hernandez
import 'package:flutter/material.dart'; // Importa la biblioteca Flutter para construir interfaces de usuario.
import 'package:movieapp_20091/common/HttpHandler.dart'; // Importa la clase HttpHandler desde un archivo llamado HttpHandler.dart.
import 'package:movieapp_20091/media_list.dart';

class Home extends StatefulWidget {
  const Home(
      {super.key}); // Constructor de Home con un parámetro opcional llamado key.
  @override
  State<Home> createState() =>
      _HomeState(); // Define una clase que extiende StatefulWidget y proporciona un método para crear su estado interno.
}

class _HomeState extends State<Home> {
  // Define una clase que extiende State y representa el estado interno de Home.

  // Estilo de fuente personalizado
  final TextStyle customTextStyle = TextStyle(
    fontFamily: 'MiFuente', // Nombre de la fuente definido en pubspec.yaml
    fontSize: 22.0, // Tamaño de fuente deseado
    fontWeight: FontWeight
        .bold, // Puedes ajustar el peso de la fuente según tus preferencias
  );

  @override
  Widget build(BuildContext context) {
    // Crear una página Scaffold que contiene la estructura principal de la aplicación
    return new Scaffold(
      appBar: new AppBar(
        // Barra de navegación superior (AppBar) con un título y un botón de búsqueda
        title: new Text("MovieApp-200931"), // Título de la aplicación
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // Acción a ejecutar cuando se presiona el botón de búsqueda
            },
          ),
        ],
      ),
      drawer: new Drawer(
        // Menú lateral (Drawer) que se despliega desde el borde izquierdo
        child: new ListView(children: <Widget>[
          new DrawerHeader(
            child: Center(
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 24,
                ),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/poster.jpg'), fit: BoxFit.cover)),
          ),
          // new DrawerHeader(
          //   child: new Material(), // Encabezado del menú lateral
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/poster.jpg'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // // Elemento del menú "peliculas"
          new ListTile(
            title: new Text(
              "peliculas",
              style:
                  customTextStyle, // Aplica el estilo de fuente personalizado
            ),
            trailing: Image.asset('assets/1.png',
                width: 45, height: 45), // Icono de películas
          ),

          // Separador en el menú
          new Divider(
            height: 5.0,
          ),

          // Elemento del menú "Television"
          new ListTile(
            title: new Text(
              "Television",
              style:
                  customTextStyle, // Aplica el estilo de fuente personalizado
            ),
            trailing: Image.asset('assets/2.png',
                width: 45, height: 45), // Icono de películas
          ),
          // Separador en el menú
          new Divider(
            height: 5.0,
          ),

          // Elemento del menú "Cerrar"
          new ListTile(
            title: new Text(
              "Cerrar",
              style:
                  customTextStyle, // Aplica el estilo de fuente personalizado
            ),
            trailing: Image.asset('assets/3.png',
                width: 45, height: 45), // Icono de películas
            // Icono de televisión
            onTap: () => Navigator.of(context)
                .pop(), // Cierra el menú al tocar este elemento
          ),
        ]),
      ),
      body: PageView(
        children: <Widget>[new MediaList()],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        // Barra de navegación inferior (BottomNavigationBar) con iconos y etiquetas
        items: _obtenerIconos(),
      ),
    );
  }

  // Método para obtener los elementos de la barra de navegación inferior
  List<BottomNavigationBarItem> _obtenerIconos() {
    return [
      new BottomNavigationBarItem(
        icon: new Icon(Icons.thumb_up), // Icono de pulgar hacia arriba
        label: ("populares"), // Etiqueta para la opción "populares"
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.update), // Icono de actualización
        label: ("Proximamente"), // Etiqueta para la opción "Proximamente"
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.star), // Icono de estrella
        label: ("Mejor valorados"), // Etiqueta para la opción "Mejor valorados"
      ),
    ];
  }
}
