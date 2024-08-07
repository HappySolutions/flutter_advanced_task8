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
        List<Post> posts = PostModel.fromRawJson(response.body).posts;
        log(posts.toString());
        return posts;
      } else {
        throw "Error Loading Posts";
      }
      // var data = await rootBundle.loadString("assets/data.json");
      // var result = json.decode(data);
      // if (result['status'] == 'OK') {
      //   postsList = List<Post>.from(
      //       result['todos'].map((json) => Post.fromJson(json)).toList());
      // }
    } catch (e) {
      rethrow;
    }
  }
}
