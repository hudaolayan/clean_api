import 'package:api_clean/featers/posts/data/data_source/posts_data_source.dart';
import 'package:api_clean/featers/posts/data/model/post_model.dart';
import 'package:api_clean/featers/posts/domain/repositries/post_repostiry.dart';

class PostRepostoryImp extends PostRepostiry {
  PostsDataSource remoteDataSource;

  PostRepostoryImp({required this.remoteDataSource});

  @override
  Future<List<PostModel>> getAllPosts() async {
    return await remoteDataSource.getAllPosts();
  }

  @override
  Future<PostModel> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    return await remoteDataSource.createPost(
      title: title,
      body: body,
      userId: userId,
    );
  }

  @override
  updatePost({
    required String title,
    required String body,
    required int userId,
    required int id,
    required int index,
  }) async {
    return await remoteDataSource.updatePost(
      title: title,
      body: body,
      userId: userId,
      id: id,
      index: index,
    );
  }

  @override
  Future<bool> deletePost({required int id}) async {
    return await remoteDataSource.deletePost(id: id);
  }
}
