import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_task8/models/posts.dart';

class PostsRepo {
  static List<Posts> postsList = [];
  Future<List<Posts>> getTodos() async {
    try {
      var data = await rootBundle.loadString("assets/data.json");
      var result = json.decode(data);
      if (result['status'] == 'OK') {
        postsList = List<Posts>.from(
            result['todos'].map((json) => Posts.fromJson(json)).toList());

        return postsList;
      }
    } catch (e) {
      rethrow;
    }
    return postsList;
  }
}
