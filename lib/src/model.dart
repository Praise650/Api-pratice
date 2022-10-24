import 'dart:convert';


// List<Post> cardsModelFromJson(String str) => List<Post>.from(json[0].map((x) => Post.fromJson(x)));

String cardsModelToJson(Post data) => json.encode(data.toJson());

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;
  Post({this.userId, this.id, this.body, this.title});
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        body: json["body"],
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "body": body,
        "id": id,
        "title": title,
        "userId": userId,
      };
}
