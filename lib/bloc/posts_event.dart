part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent extends Equatable {
  const PostsEvent();
  @override
  List<Object?> get props => [];
}

class GetPostsEvent extends PostsEvent {}
