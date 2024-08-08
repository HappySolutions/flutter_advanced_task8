import 'package:flutter/material.dart';
import 'package:flutter_advanced_task8/bloc/post_bloc/posts_bloc.dart';
import 'package:flutter_advanced_task8/widgets/posts_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PostsBloc>().add(GetPostsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Posts Page')),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PostsLoadedState) {
            return PostsListWidget(posts: state.posts);
          }
          if (state is PostsEmptyState) {
            return const Center(
              child: Text('No posts found'),
            );
          }
          if (state is PostsLoadingErrorState) {
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
