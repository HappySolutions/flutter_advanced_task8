import 'package:flutter/material.dart';
import 'package:flutter_advanced_task8/data/models/post.dart';
import 'package:flutter_advanced_task8/pages/comments/comments_page.dart';

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
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Post Title: ',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    post.title ?? 'No title',
                    style: const TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Divider(),
              ),
              const Text(
                'Post body: ',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
              ),
              Text(
                post.body ?? 'No text',
                style: const TextStyle(fontSize: 10.0, height: 1.5),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommentsPage(
                                post: post,
                              )));
                },
                child: const Text('Show Comments'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
