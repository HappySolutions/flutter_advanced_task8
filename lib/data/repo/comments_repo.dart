import 'dart:convert';
import 'package:flutter_advanced_task8/data/data_provider/data_provider.dart';
import 'package:flutter_advanced_task8/data/models/comment.dart';

class CommentsRepo {
  DataProvider dataProvider = DataProvider();

  Future<List<Comment>> getComments(int id) async {
    try {
      final response = await DataProvider.getRequests(
          endpoint: "https://jsonplaceholder.typicode.com/comments?postId=$id");
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        var comments =
            List<Comment>.from(data.map((e) => Comment.fromJson(e)).toList());
        return comments;
      } else {
        throw "Error Loading comments";
      }
    } catch (e) {
      rethrow;
    }
  }
}
