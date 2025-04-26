import '../../data/model/post_model.dart';
import '../repositries/post_repostiry.dart';

class UpdatePostUseCase {
  PostRepostiry postRepostiry;

  UpdatePostUseCase({required this.postRepostiry});

  Future<PostModel> call({
    required String title,
    required String body,
    required int userId,
    required int id,
    required int index,
  }) async {
    return await postRepostiry.updatePost(
      title: title,
      body: body,
      userId: userId,
      id: id,
      index: index,
    );
  }
}
