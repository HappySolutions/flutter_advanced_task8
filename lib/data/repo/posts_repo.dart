import 'dart:convert';
import 'dart:developer';
import 'package:flutter_advanced_task8/data/data_provider/data_provider.dart';
import 'package:flutter_advanced_task8/data/models/posts.dart';

class PostsRepo {
  DataProvider dataProvider = DataProvider();

  Future<List<Post>> getPosts() async {
    try {
      final response = await DataProvider.getRequests(
          endpoint: "https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode == 200) {
        // List<Post> posts =
        //     Post.fromJson(response.body) as List<Post>;
        final dynamic data = json.decode(response.body);
        var posts = List<Post>.from(data.map((e) => Post.fromJson(e)).toList());
        return posts;
      } else {
        throw "Error Loading Posts";
      }
    } catch (e) {
      rethrow;
    }
  }
}
