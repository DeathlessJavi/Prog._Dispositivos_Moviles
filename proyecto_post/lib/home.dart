/*
Clase que muestro todos los post extraidos de Jsonplaceholder.
*/

import 'package:flutter/material.dart';
import 'package:peticiones_post/clases.dart';
import 'package:peticiones_post/comments.dart';
import 'package:peticiones_post/get_data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Data data = new Data(); 
  //aqui se incluyen en la lista las publicaciones obtenidas
  List<Post> _post = List<Post>();

  @override
  //initState es uasado para llamar a todas las publicacion al momento de la ejecucuon
  void initState() {
    //Este metodo obtiene los datos desde el Jsonplaceholver y los guarda en la lista de publicaciones/post
    data.getPost().then((value) => setState(() {
          _post.addAll(value);
        }));
    super.initState();
  }

  //Plantilla usada para crear los iconos bajo el post llamada Widget.
  Widget optionIcon(Icon icon, double size, Color color) {
    return IconButton(
      color: color,
      iconSize: size,
      splashColor: Colors.purple,
      icon: icon,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            splashColor: Colors.purple[300],
            icon: Icon(Icons.view_headline),
            onPressed: () {},
          ),
          title: Text("Posts"),
          backgroundColor: Colors.purple[900]),
      body: ListView.builder(
        //Todas las publicaciones estaran aquí.
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(5),
            color: Colors.purple[900],
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //Estilos de las publicacion
                      Text(
                        //obtenemos el indice de cada publicacion
                        _post[index].title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        //Se obtiene contenido de cada índice de la lista de Posts.
                        "\n${_post[index].body}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width - 40,
                    child: Row(
                      //Mostramos los iconos en cada publicacion/post.
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        optionIcon(Icon(Icons.thumb_up), 24, Colors.white),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        IconButton(
                          color: Colors.white,
                          iconSize: 24,
                          splashColor: Colors.white,
                          icon: Icon(Icons.comment),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Comments(
                                      post: _post[index],
                                    )));
                          },
                        ),
                        Text("5",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        optionIcon(Icon(Icons.share), 24, Colors.white),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
