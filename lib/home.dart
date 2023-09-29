import 'package:flutter/material.dart';
import 'package:movieapp_200687/common/HttpHandler.dart';
import 'package:movieapp_200687/model/media.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  _loadJson() async {
    try {
      List data = await HttpHandler().fetchMovies();
      print(data);
    } catch (ex) {
      print('Error loading data: $ex');
    }
  }

  final TextStyle customTextStyle = TextStyle(
    fontFamily: 'MiFuente',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MovieApp-200687"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // Acción a ejecutar cuando se presiona el botón de búsqueda
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Container()),

            ListTile(
              title: Text(
                "Peliculas",
                style: customTextStyle,
              ),
              trailing: Icon(Icons.local_movies),
            ),

            Divider(height: 5.0),

            ListTile(
              title: Text(
                "Television",
                style: customTextStyle,
              ),
              trailing: Icon(Icons.live_tv),
            ),

            Divider(height: 5.0),

            ListTile(
              title: Text(
                "Cerrar",
                style: customTextStyle,
              ),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _obtenerIconos(),
      ),
    );
  }

  List<BottomNavigationBarItem> _obtenerIconos() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.thumb_up),
        label: "Populares",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.update),
        label: "Próximamente",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: "Mejor valorados",
      ),
    ];
  }
}
