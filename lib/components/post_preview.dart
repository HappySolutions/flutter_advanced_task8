import 'package:flutter/material.dart';
import 'package:flutter_advanced_task8/data/models/posts.dart';

class PostPreview extends StatelessWidget {
  final Post post;

  const PostPreview({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.55,
      width: size.width,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title ?? 'No title',
              style:
                  const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Divider(),
            ),
            Text(
              post.body ?? 'No text',
              style: const TextStyle(fontSize: 10.0, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
