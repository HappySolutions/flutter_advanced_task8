import 'dart:convert';
import 'dart:core';

class PostModel {
  final List<Post> posts;

  PostModel({required this.posts});

  factory PostModel.fromRawJson(String str) =>
      PostModel.fromJson(json.decode(str));

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );
}

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
