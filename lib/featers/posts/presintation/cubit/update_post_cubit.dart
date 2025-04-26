import 'package:api_clean/featers/posts/domain/use_case/update_post_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/update_post_state.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostUseCase updatePostUseCase;

  UpdatePostCubit({required this.updatePostUseCase})
    : super(UpdatePostStateInitial());

  updatePost({
    required String title,
    required String body,
    required int userId,
    required int id,
    required int index,
  }) {
    emit(UpdatePostStateLoading());
    updatePostUseCase.call(
          title: title,
          body: body,
          userId: userId,
          id: id,
          index: index,
        )
        .then((post) {
          emit(UpdatePostStateSuccess(post: post));
        })
        .catchError((error) {
          emit(UpdatePostStateError(error: error.toString()));
        });
  }
}
