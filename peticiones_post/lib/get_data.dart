/*
Clase Data que contiene los métodos para obtener los datos de Post y Comments de su sitio remoto.
*/

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:peticiones_post/clases.dart';

class Data {

  //Método para obtener todos los datos de Post desde su sitio remoto correspondiente.
  Future<List<Post>> getPost() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);

    var posts = List<Post>(); //Lista donde se almacenarán los objetos de cada post

    if (response.statusCode == 200) {
      var postsJson = json.decode(response.body);

      for (var postJson in postsJson) {
        posts.add(Post.fromJson(postJson));
      }
    }
    return posts;
  }
  //Con este metodo se obitienen los datos desde Jsonplaceholser haciendo uso del Id de cada post
  Future<List<Comment>> getComments(int postId) async {
    var url = 'https://jsonplaceholder.typicode.com/posts/$postId/comments';
    var response = await http.get(url);

    //En la lista se van almancenar los comentarios
    var comments = List<Comment>(); 

    if (response.statusCode == 200) {
      var commentsJson = json.decode(response.body);

      for (var commentJson in commentsJson) {
        comments.add(Comment.fromJson(commentJson));
      }
    }
    return comments;
  }
}