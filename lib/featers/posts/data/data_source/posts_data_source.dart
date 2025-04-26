import 'package:api_clean/core/network/api_client.dart';
import 'package:api_clean/featers/posts/data/model/post_model.dart';

abstract class PostsDataSource {
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

class PostsRemoteDataSource extends PostsDataSource {
  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await ApiClient.getDataList(
      endpoint: "posts",
      fromJsonT: (data) => PostModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<PostModel> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    final response = await ApiClient.postData(
      endpoint: "posts",
      body: {"title": title, 'body': body, 'userId': userId},
      fromJsonT: (data) => PostModel.fromJson(json: data),
    );
    return response;
  }

  @override
  updatePost({
    required String title,
    required String body,
    required int userId,
    required int id,
    required int index,
  }) async {
    final response = await ApiClient.putData(
      endpoint: "posts/$id",
      body: {"title": title, 'body': body, 'userId': userId, 'id': id},
      fromJsonT: (data) => PostModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<bool> deletePost({required int id}) async {
    final response = await ApiClient.deleteData(
      endpoint: "posts/$id",
      fromJsonT: (data) => PostModel.fromJson(json: data),
    );
    return response;
  }
}
