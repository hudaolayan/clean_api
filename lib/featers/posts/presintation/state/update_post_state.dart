import '../../data/model/post_model.dart';

abstract class UpdatePostState {}

class UpdatePostStateLoading extends UpdatePostState {}

class UpdatePostStateSuccess extends UpdatePostState {
  final PostModel post;

  UpdatePostStateSuccess({required this.post});
}

class UpdatePostStateError extends UpdatePostState {
  final String error;

  UpdatePostStateError({required this.error});
}

class UpdatePostStateInitial extends UpdatePostState {}
