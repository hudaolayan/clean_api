import 'package:api_clean/featers/posts/domain/use_case/get_post_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post_model.dart';
import '../state/get_all_post_state.dart';

class GetAllPostCubit extends Cubit<GetAllPostState> {
  GetPostUseCase getPostsUseCase;

  GetAllPostCubit({required this.getPostsUseCase}) : super(GetAllPostInitial());

  getAllPosts() {
    emit(GetAllPostStateLoading());
    getPostsUseCase
        .call()
        .then((posts) {
      emit(GetAllPostStateSuccess(posts: posts));
    })
        .catchError((error) {
      emit(GetAllPostStateError(error: error.toString()));
    });
  }

  addPost({required PostModel postModel}) {
    var curentState = state;
    emit(GetAllPostStateLoading());
    if (curentState is GetAllPostStateSuccess) {
      curentState.posts.insert(0, postModel);
      emit(GetAllPostStateSuccess(posts: curentState.posts));
    }
  }

  updatePost({required PostModel postModel, required int index}) {
    var currentState = state;
    emit(GetAllPostStateLoading());
    if (currentState is GetAllPostStateSuccess) {
      currentState.posts[index] = postModel;
      emit(GetAllPostStateSuccess(posts: currentState.posts));
    }
  }

  updateLoading({required int index}) {
    var currentState = state;
    emit(GetAllPostStateLoading());
    if (currentState is GetAllPostStateSuccess) {
      currentState.posts[index].isLoading = true;
      emit(GetAllPostStateSuccess(posts: currentState.posts));
    }
  }

  deletePost({required int index}) {
    var currentState = state;
    emit(GetAllPostStateLoading());
    if (currentState is GetAllPostStateSuccess) {
      currentState.posts.removeAt(index);
      emit(GetAllPostStateSuccess(posts: currentState.posts));
    }
  }
}
