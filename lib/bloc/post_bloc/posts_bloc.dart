import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_advanced_task8/data/models/post.dart';
import 'package:flutter_advanced_task8/data/repo/posts_repo.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepo postsRepo;
  PostsBloc({required this.postsRepo}) : super(PostsInitial()) {
    on<GetPostsEvent>(loadPosts);
  }

  FutureOr<void> loadPosts(
      GetPostsEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoadingState());
    try {
      final posts = await postsRepo.getPosts();
      if (posts.isEmpty) {
        emit(PostsEmptyState());
      } else {
        emit(PostsLoadedState(posts: posts));
      }
    } catch (e) {
      final message = e.toString();
      emit(PostsLoadingErrorState(errorMessage: message));
    }
  }
}
