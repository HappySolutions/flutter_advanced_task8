import 'package:flutter/material.dart';
import 'package:flutter_advanced_task8/bloc/comment_bloc/comments_bloc.dart';
import 'package:flutter_advanced_task8/data/models/post.dart';
import 'package:flutter_advanced_task8/widgets/comments_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsPage extends StatefulWidget {
  final Post post;
  const CommentsPage({required this.post, super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  void initState() {
    context.read<CommentsBloc>().add(GetCommentsEvent(widget.post.id ?? 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title ?? 'No title'),
      ),
      body: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
          if (state is CommentsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CommentsLoadedState) {
            return CommentsList(
              comments: state.comments,
            );
          }
          if (state is CommentsEmptyState) {
            return const Center(
              child: Text('No comments found'),
            );
          }
          if (state is CommentsLoadingErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.network_check_rounded,
                    color: Colors.blueAccent,
                    size: 40.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(state.errorMessage),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
