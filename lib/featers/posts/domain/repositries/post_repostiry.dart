import '../../data/model/post_model.dart';

abstract class PostRepostiry {
  Future<List<PostModel>> getAllPosts();

  Future<PostModel> createPost({
    required String title,
    required String body,
    required int userId,
  });

  updatePost({
    required String title,
    required String body,
    required int userId,
    required int id,
    required int index,
  });

  Future<bool> deletePost({required int id});

}
