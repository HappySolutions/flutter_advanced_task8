import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_task8/bloc/comment_bloc/comments_bloc.dart';
import 'package:flutter_advanced_task8/bloc/post_bloc/posts_bloc.dart';
import 'package:flutter_advanced_task8/data/repo/comments_repo.dart';
import 'package:flutter_advanced_task8/pages/home/home_page.dart';
import 'package:flutter_advanced_task8/data/repo/posts_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PostsRepo>(
            create: (context) => PostsRepo(),
          ),
          RepositoryProvider<CommentsRepo>(
            create: (context) => CommentsRepo(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) =>
                  PostsBloc(postsRepo: context.read<PostsRepo>()),
            ),
            BlocProvider(
              create: (BuildContext context) =>
                  CommentsBloc(commentsRepo: context.read<CommentsRepo>()),
            ),
          ],
          child: const HomePage(),
        ),
      ),
    );
  }
}
