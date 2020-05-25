/*
La finalidad de esta clase es mostrar las publicaciones con los comentarios en cada una de ellas.
*/

import 'package:flutter/material.dart';
import 'package:peticiones_post/clases.dart';
import 'package:peticiones_post/get_data.dart';

class Comments extends StatefulWidget {
  //Esta variable sera Utilizada en la clase home la cual hace referencia a las publicaciones o post
  final Post post; 

  Comments({@required this.post});

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Data data =
      new Data(); 
      //hacemos uso de los comentarios que se estan obteniendo.
  List<Comment> _comments = List<Comment>(); 

  @override
  //EL metodo InitState esta obteniendo los comentarios de la publicacion los cuales estan siendo
  //usados desde el archivo Json metiendolos a las lista
  void initState() {
    super.initState();
    data.getComments(widget.post.id).then((value) => setState(() {
          _comments.addAll(value);
        }));
  }

  //Plantilla de Widget para crear los IconButton en la publicacion.
  Widget optionIcon(Icon icon, double size, Color color) {
    return IconButton(
      color: color,
      iconSize: size,
      splashColor: Colors.yellow[300],
      icon: icon,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comentarios"),
          backgroundColor: Colors.yellow[900],
        ),
        // con esta caracteristica le damos formato al contendio.
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                //Dado el clic a la publicacicion de despliega dicha publicacion con sus respestivos comentarios.
                margin: EdgeInsets.all(5),
                color: Colors.yellow[900],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, right: 20.0, left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          //Estilos del texto con el titulo principal de la publicacion
                          Text(
                            widget.post.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          //estilos del comentario en la publicacion
                          Text(
                            "\n${widget.post.body}",
                            style: TextStyle(color: Colors.white60),
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
                          //Muestra los icones en el post al igual que se establecen los estilos de los mismos.
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            optionIcon(
                                Icon(Icons.thumb_up), 24, Colors.white),
                            Text(
                              "0",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            optionIcon(
                                Icon(Icons.comment), 24, Colors.white),
                            Text(
                              "${_comments.length}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            optionIcon(Icon(Icons.share), 24, Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height - 320,
                    child: ListView.builder(
                      //Muestra los comentarios igual que se establecen los estilos de los mismos.
                        itemCount: _comments.length,
                        itemBuilder: (context, index) {
                          return Card(
                            //Los Comentarios estan en una lista la cual se puede desplegar de manera
                            //independiente al post principal al igual que se establece cada uno en 
                            //una card y el estilo de lo mismos
                            color: Colors.yellow[500],
                            child: ListTile(
                                title: Text(
                                  //Se obtiene nombre de cada índice de la lista de comentarios.
                                  _comments[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                subtitle: Text(
                                  //Se obtiene email y comentario de cada índice de la lista de comentarios.
                                    "${_comments[index].email}\n\n${_comments[index].body}",
                                    style: TextStyle(color: Colors.white70)),
                                isThreeLine: true,
                                trailing: optionIcon(
                                    Icon(Icons.mail), 24, Colors.white),
                                dense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/user.png'),
                                )),
                          );
                        }),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
