/*
Clases donde se definen los objetos de Publicaciones y Comentarios haciendo uso del archivo Json.
*/

class Post {
  //variables que seran implementadas en la Publicacion o Post
  int userId;
  int id;
  String title;
  String body;

 Post(this.userId, this.id, this.title, this.body);
  
 Post.fromJson(Map<String, dynamic> json){
   //mapeo de las variables que vamos obtener del archivo Json
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}

class Comment {
  //variables las cuales seran implementadas en los Comentarios o Comment
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment(this.postId, this.id, this.name, this.email, this.body);

  Comment.fromJson(Map<String, dynamic> json){
    //mapeo de las variables del json
    postId = json["postId"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    body = json["body"];
  }
}