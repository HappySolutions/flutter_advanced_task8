part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

final class PostsLoadingState extends PostsState {}

final class PostsLoadedState extends PostsState {
  PostsLoadedState({required this.posts});
  final List<Post> posts;
}

final class PostsEmptyState extends PostsState {}

final class PostsLoadingErrorState extends PostsState {
  PostsLoadingErrorState({required this.errorMessage});
  final String errorMessage;
}
