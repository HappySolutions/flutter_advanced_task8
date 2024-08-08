part of 'comments_bloc.dart';

sealed class CommentsState {}

final class CommentsInitial extends CommentsState {}

final class CommentsLoadingState extends CommentsState {}

final class CommentsLoadedState extends CommentsState {
  CommentsLoadedState({required this.comments});
  final List<Comment> comments;
}

final class CommentsEmptyState extends CommentsState {}

final class CommentsLoadingErrorState extends CommentsState {
  CommentsLoadingErrorState({required this.errorMessage});
  final String errorMessage;
}
