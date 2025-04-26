abstract class DeletePostState {}

class DeletePostStateLoading extends DeletePostState {}

class DeletePostStateSuccess extends DeletePostState {}

class DeletePostStateError extends DeletePostState {
  final String error;

  DeletePostStateError({required this.error});
}

class DeletePostStateInitial extends DeletePostState {}
