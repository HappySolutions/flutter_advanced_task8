import 'package:flutter/material.dart';
import 'package:flutter_advanced_task8/bloc/posts_bloc.dart';
import 'package:flutter_advanced_task8/components/post_card.dart';
import 'package:flutter_advanced_task8/components/post_preview.dart';
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
      appBar: AppBar(),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PostsLoadedState) {
            return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final post = state.posts[index];
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: PostPreview(post: post));
                        },
                      );
                    },
                    child: PostCard(post: post),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemCount: state.posts.length);
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
