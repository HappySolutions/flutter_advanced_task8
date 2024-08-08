import 'package:flutter/material.dart';
import 'package:flutter_advanced_task8/data/models/comment.dart';

class CommentsList extends StatelessWidget {
  final List<Comment> comments;

  const CommentsList({
    required this.comments,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final comment = comments[index];
          return Container(
            height: 150,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.name ?? 'No title',
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10.0),
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  comment.body ?? 'No Text',
                  style: const TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: comments.length);
  }
}
