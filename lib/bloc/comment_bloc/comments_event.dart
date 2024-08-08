part of 'comments_bloc.dart';

sealed class CommentsEvent {}

class GetCommentsEvent extends CommentsEvent {
  final int postId;
  GetCommentsEvent(this.postId);
}
