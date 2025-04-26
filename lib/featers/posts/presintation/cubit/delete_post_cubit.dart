import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/delete_post_use_case.dart';
import '../state/delete_post_state.dart';

class DeletePostCubit extends Cubit<DeletePostState> {
  DeletePostUseCase deletePostUseCase;

  DeletePostCubit({required this.deletePostUseCase})
    : super(DeletePostStateInitial());

  deletePost({
    required int id
  }) {
    emit(DeletePostStateLoading());
    deletePostUseCase
        .call(id: id)
        .then((post) {
          emit(DeletePostStateSuccess());
        })
        .catchError((error) {
          emit(DeletePostStateError(error: error.toString()));
        });
  }
}
