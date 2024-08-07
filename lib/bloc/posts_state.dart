part of 'posts_bloc.dart';

@immutable
sealed class PostsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PostsInitial extends PostsState {}

final class PostsLoadingState extends PostsState {}

final class PostsLoadedState extends PostsState {
  PostsLoadedState({required this.posts});
  final List<Post> posts;
  @override
  List<Object?> get props => [posts];
}

final class PostsEmptyState extends PostsState {}

final class PostsLoadingErrorState extends PostsState {
  PostsLoadingErrorState({required this.errorMessage});
  final String errorMessage;
}
