import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_advanced_task8/data/models/comment.dart';
import 'package:flutter_advanced_task8/data/repo/comments_repo.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final CommentsRepo commentsRepo;

  CommentsBloc({required this.commentsRepo}) : super(CommentsInitial()) {
    on<GetCommentsEvent>(loadComments);
  }

  FutureOr<void> loadComments(
      GetCommentsEvent event, Emitter<CommentsState> emit) async {
    emit(CommentsLoadingState());
    try {
      final comments = await commentsRepo.getComments(event.postId);
      if (comments.isEmpty) {
        emit(CommentsEmptyState());
      } else {
        emit(CommentsLoadedState(comments: comments));
      }
    } catch (e) {
      final message = e.toString();
      emit(CommentsLoadingErrorState(errorMessage: message));
    }
  }
}
